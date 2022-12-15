import numpy as np   #needs install
import os
import pandas #needs install
import sys
import argparse
import mpi4py

class Alya_output_parse():

    def __init__(self, project_name):
        self.project_name = project_name
        self.actmap = []
        self.relmap = []
        self.maxamp = []
        self.maxfound = []
        self.n_nodes = 0
        self.prev_v = []
        self.prev_time = 0.0
        self.file_counter = 0
        self.ensight_float_type = np.float32
        self.ensight_id_type = np.int32

    ### Function definitions
    def identify_alya_id_type(self):
        #read he header where element ids are stored and see if it's int8 or int4
        project_name = self.project_name
        filename = os.path.join(inputfolder,project_name+ '-LNODS'+str(file_suffix));


        with open(filename, 'rb') as f:
            header = self.read_header(f)
            if '32' in header['DataType']:
                alya_id_type = np.int32
            elif '64' in header['DataType']:
                alya_id_type = np.int64
            else:
                assert False, 'Alya id type '+header[6]+' is not supported'
        return alya_id_type


    def read_header(self,file_object):
        if MPIO:
            return self.read_header_mpio(file_object)
        else:
            return self.read_header_alyabin(file_object)


    def read_header_mpio(self,f):
        magic = np.fromfile(f,count=1, dtype=np.int64)[0]
        if magic != 27093:
            print('File '+filename+' does not appear to be alya mpio file')

        format = str(f.read(8))
        if not ('MPIAL' in format):
            assert False,'File '+filename+' does not appear to be alya mpio file'

        version = str(f.read(8))
        obj = str(f.read(8))
        dimension = str(f.read(8))
        association = str(f.read(8))
        datatype = str(f.read(8))
        datatypelen = str(f.read(8))
        seq_par = str(f.read(8))
        filt = str(f.read(8))
        sorting = str(f.read(8))
        idd = str(f.read(8))

        if not ('NOID' in idd):
            assert False, 'ID column in '+filename+' is not supported'


        junk = str(f.read(8))
        if not ('0000000' in junk):
            assert False,   'Lost alignment reding '+filename


        columns = np.fromfile(f,count=1,dtype=np.int64)[0]
        lines = np.fromfile(f,count=1,dtype=np.int64)[0]
        timestep_no = np.fromfile(f,count=1,dtype=np.int64)[0]
        nsubdomains = np.fromfile(f,count=1,dtype=np.int64)[0]
        mesh_div = np.fromfile(f,count=1,dtype=np.int64)[0]
        tag1 = np.fromfile(f,count=1,dtype=np.int64)[0]
        tag2 = np.fromfile(f,count=1,dtype=np.int64)[0]
        time = np.fromfile(f,count=1,dtype=np.float64)[0]

        junk = str(f.read(8))
        if not ('0000000' in junk):
            assert False,'Lost alignment reding '+filename

        junk = str(f.read(8))    #1
        junk = str(f.read(8))    #2
        junk = str(f.read(8))    #3
        junk = str(f.read(8))    #4
        junk = str(f.read(8))    #5
        junk = str(f.read(8))    #6
        junk = str(f.read(8))    #7
        junk = str(f.read(8))    #8
        junk = str(f.read(8))    #9
        junk = str(f.read(8))    #10

        if 'INT' in datatype:
            dt = 'int'
        elif 'REAL' in datatype:
            dt = 'float'
        else:
            assert False,'Unsupported data type '+datatype

        if '8' in datatypelen:
            dt = dt+'64'
        elif '4' in datatypelen:
            dt = dt+'32'
        else:
            assert False,'Unsupported data type length '+ datatypelen


        header = {'DataType':dt, 'Lines':lines,'Columns':columns, 'TimeStepNo':timestep_no, 'Time':time, 'NSubdomains':nsubdomains}

        if 'ELEM' in association:
            header['Association'] = 'element'
        elif 'POIN' in association:
            header['Association'] = 'node'
        else:
            assert False,'Unsupported association: '+association


        if 'SCALA' in dimension:
            header['VariableType'] = 'scalar'
        elif( 'VECTO' in dimension  ):
            header['VariableType'] = 'vector'
        else:
            assert False, 'unsupported type of variable '+str(variable_type)

        assert ('NOFIL' in filt), "Filtered fields are not supported"


        return header


    def read_one_fp90_record(self,file_object, number_of_elements, datatype):
        #fortran stores length with every block, in the beginning and the end
        count_read = 0
        record = []
        while count_read<number_of_elements:
            #in case the record is stored as several blocks join them
            block_len = np.fromfile(file_object, dtype=np.int32, count=1)
            #block_len is in bytes
            block = np.fromfile(file_object, dtype=datatype, count=block_len[0]//np.dtype(datatype).itemsize)
            block_len = np.fromfile(file_object, dtype=np.int32, count=1)
            count_read = count_read+block_len
            record = record + [block]

        return np.concatenate(record)


    def read_header_alyabin(self,file_object):
        #a sanity check
        assert hasattr(file_object, 'read'), "read_header: argument is not a file object"

        ihead = self.read_one_fp90_record(file_object, 1, np.int32)    #! Header: 1234, int32
        assert ihead[0] ==1234, "Header is not 1234"
        strings = [];
        integers = [];
        for i in range(0,9):
            strings = strings +[self.read_one_fp90_record(file_object, 8, np.uint8).tostring().decode().strip()]

        for i in range(0,5):
            integers = integers +[self.read_one_fp90_record(file_object, 1, np.int32)]

        if( strings[1][0:5] != 'V0001' ):
            integers = integers +[self.read_one_fp90_record(file_object, 1, np.int32)]
            #read(ii) integers(4) ! Time step, int32

        reals = self.read_one_fp90_record(file_object, 1, np.float64)
        #read(ii) reals(1)    ! Time, float64

        if( strings[1][0:5] == 'V0001' ):
            integers[3] = int(reals)  #! floor()?

        #return {'strings':strings, 'integers':integers, 'reals':reals}

        number_of_dimensions = integers[0][0]
        number_of_tuples_total = integers[1][0]
        time_instant_int = integers[3][0]
        time_instant_real = reals[0]

        if( strings[5] == 'REAL' ):
            field_dtype = 'float'
        if( strings[5] == 'INTEG' ):
            field_dtype = 'int'

        if( strings[4] == 'NPOIN'):
            association = 'node'
        else:
            association = 'element'

        if strings[6] == '4BYTE':
            field_dtype = field_dtype + '32'
        elif strings[6] == '8BYTE':
            field_dtype = field_dtype + '64'
        else:
            assert False, 'Alya id type '+ str(header[6])+' is not supported'


        if( strings[3] == 'SCALA' ):
            variabletype = 'scalar'
        elif( strings[3] == 'VECTO' ):
            variabletype = 'vector'
        else:
            assert False, "unsupported type of variable"


        assert ( strings[8] == 'NOFIL'), "Filtered types not supported"

        header = {'DataType':field_dtype, 'Lines':number_of_tuples_total,'Columns':number_of_dimensions, 'TimeStepNo':time_instant_int, \
                    'Time':time_instant_real, 'Association': association, 'VariableType': variabletype}

        return header


    def read_alya_array(self,filename, number_of_blocks):
        if MPIO:
            return self.read_alyampio_array(filename, number_of_blocks)
        else:
            return self.read_alyabin_array(filename, number_of_blocks)


    def read_alyampio_array(self,filename, number_of_blocks):
        with open(filename, 'rb') as f:
            header = self.read_header_mpio(f)

            tuples = np.reshape( np.fromfile(f, dtype=np.dtype(header['DataType']) ), (header['Lines'], header['Columns']) )

            return {'tuples':tuples, 'header':header, 'tuples_per_block':[]};


    def read_alyabin_array(self,filename, number_of_blocks):
        with open(filename,'rb') as f:
            header = self.read_header_alyabin(f)
            number_of_dimensions = header['Columns']
            number_of_tuples_total = header['Lines']
            time_instant_int = header['TimeStepNo']
            time_instant_real = header['Time']
            #print(f'Reading array: {number_of_dimensions} dim, {number_of_tuples_total} tuples\n')

            datatype = np.dtype( header['DataType'] )

            tuples = np.zeros((number_of_tuples_total,number_of_dimensions), dtype=datatype)

            c = 0;
            tuples_per_block = np.zeros(number_of_blocks, dtype=np.int32)

            for i in range(number_of_blocks):
                number_of_tuples_in_block = self.read_one_fp90_record(f, 1, alya_id_type)[0] #stored by alya
                tuples_per_block[i] = number_of_tuples_in_block

                #print(f'Block {i}/{number_of_blocks}: {(number_of_tuples_in_block)} tuples\n')
                tuples_temp = self.read_one_fp90_record(f, number_of_dimensions*number_of_tuples_in_block, datatype)

                tuples[c:c+number_of_tuples_in_block, :] =                 np.reshape(tuples_temp, (number_of_tuples_in_block,number_of_dimensions))
                c = c+number_of_tuples_in_block

        return {'tuples':tuples, 'header':header, 'tuples_per_block':tuples_per_block};


    def read_alya_variable(self, variable_name, iteration, number_of_blocks, file_suffix):
        project_name = self.project_name
        field_filename = os.path.join(inputfolder, '%s-%s-%08d%s'% (project_name, variable_name, iteration, file_suffix))
        #print(field_filename)
        field_data = self.read_alya_array(field_filename, number_of_blocks)
        return field_data


    def read_file(self, varname, iteration, number_of_blocks, file_suffix, t_start):
        try:
            data = self.read_alya_variable(varname, iteration, number_of_blocks, file_suffix)
        except:
            print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!')
            print('!!! An error occured reading variable ',varname,' iteration ', iteration)
            print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!')
            sys.stdout.flush()
            return {'time_real':-1, 'time_int':-1,             'variable_type':'FAILED', 'variable_association':'FAILED'}
        # Update file file counter
        self.file_counter = self.file_counter + 1

        # Update activation map
        v = data['tuples']
        for i in range(0, len(data['tuples'])):
            t = data['header']['Time'].astype(self.ensight_float_type)
            if (t >= t_start):
                if ((v[i][0] > 0.0) & (self.actmap[i] == 0.0)):
                    self.actmap[i] = -v[i][0]*(self.prev_time - t)/(self.prev_v[i]-v[i][0]) + self.prev_time - t_start 

                # Update relaxation map
                if (self.maxamp[i] < v[i]) & (self.maxfound[i] == 0):
                    self.maxamp[i] = v[i]
                if (self.prev_v[i] > v[i]) & (v[i] > 0):
                    self.maxfound[i] = 1

                # Get initial membrane potential
                if (self.file_counter == 1):
                    self.vm0 = v[i][0]

                # Evaluate relaxation time
                if (self.maxfound[i] == 1) & (self.relmap[i] == 0):
                    ap90 = 0.1 * (self.maxamp[i] - self.vm0) + self.vm0
                    if ((self.prev_v[i] - ap90)*(v[i]-ap90) < 0.0):
                        self.relmap[i] = (self.prev_time - t)*(self.prev_v[i]-ap90)/(self.prev_v[i]-v[i]) + self.prev_time - t_start
            #else:
                #print('Ignoring this file because t < t_start')

        self.prev_v = v
        self.prev_time = t




    def read_geometry(self, inputfolder, file_suffix, number_of_blocks, partitions, inverse_pt_correspondence):
        project_name = self.project_name
        point_coordinates = self.read_alya_array(os.path.join(inputfolder,project_name+ '-COORD'+str(file_suffix)),number_of_blocks)
        self.element_types = self.read_alya_array(os.path.join(inputfolder,project_name+ '-LTYPE'+str(file_suffix)),number_of_blocks)
        #Read connectivity (indices inside start with 1)
        connectivity = self.read_alya_array(os.path.join(inputfolder,project_name+ '-LNODS'+str(file_suffix)),number_of_blocks)

        a = partitions['Elements'][0]
        npts =  partitions['Points'][0]
        for i in range(1, partitions['Elements'].shape[0]): #for each block, skip 0
            b = a + partitions['Elements'][i]
            connectivity['tuples'][a:b,:] = connectivity['tuples'][a:b,:] + npts
            a = b
            npts = npts + partitions['Points'][i]

        #print("Connectivty dimensions:", connectivity['tuples'].shape)


        #Ensight groups elements by type. Create grouping
        element_alya2ensi = {37:{'Name':b'hexa8','Vertices':8}, 30:{'Name':b'tetra4','Vertices':4}, \
                             32:{'Name':b'pyramid5','Vertices':5}, 34:{'Name':b'penta6','Vertices':6},\
                             10:{'Name':b'tria3','Vertices':3}, 12:{'Name':b'quad4','Vertices':4}}



        point_coordinates1 = point_coordinates['tuples']
        self.num_nodes_parallel = len(point_coordinates1)

        ndim = point_coordinates1.shape[1]
        point_coordinates2 = np.zeros( (inverse_pt_correspondence.max()+1, ndim ), dtype=self.ensight_float_type)
        point_coordinates2[inverse_pt_correspondence,:] = point_coordinates1
        #print('Point ',inverse_pt_correspondence[0], ', ', point_coordinates2[inverse_pt_correspondence[0],:])

        self.point_coordinates = point_coordinates2
        connectivity = connectivity['tuples'];
        self.connectivity = connectivity
        for i in range(connectivity.shape[1]):
            #here -1 to transform to python array, and +1 to ensight array indexing
            self.connectivity[:,i] = inverse_pt_correspondence[connectivity[:,i]-1]+1
        self.number_of_points = self.point_coordinates.shape[0]

    def write_case(self, outputfolder):
        print('Writing to '+str(os.path.join(outputfolder,self.project_name+ '_MAPS.ensi.case')))
        with open(os.path.join(outputfolder,self.project_name+ '_MAPS.ensi.case'),'w') as f:
            f.write('# Converted from Alya\n# Ensight Gold format\n# \n# Problem name: '+str(self.project_name)+'\n')
            f.write('FORMAT\ntype: ensight gold\n\nGEOMETRY\nmodel: 1 '+str(self.project_name)+'.ensi.geo\n\n')
            f.write('VARIABLE\nscalar per node:\t1\tACTIV\t'+str(self.project_name)+'.ensi.ACTIV\n')
            f.write('scalar per node:\t1\tRELAX\t'+str(self.project_name)+'.ensi.RELAX')

    def write_geometry(self, outputfolder):
        #geometry ensight
        project_name = self.project_name
        print('Writing to '+str(os.path.join(outputfolder,project_name+ '.ensi.geo')))
        with open(os.path.join(outputfolder,project_name+ '.ensi.geo'),'wb') as f:
            f.write(b'C Binary'.ljust(80))
            f.write(b'description line 1'.ljust(80))
            f.write(b'description line 2'.ljust(80))
            f.write(b'node id given'.ljust(80))
            f.write(b'element id given'.ljust(80))
            f.write(b'part'.ljust(80))
            f.write(np.array([1], dtype=self.ensight_id_type))   #int
            f.write(b'description line 1'.ljust(80))
            f.write(b'coordinates'.ljust(80))

            number_of_points = self.point_coordinates.shape[0]
            f.write(np.array([number_of_points], dtype=self.ensight_id_type))   #int
            f.write(np.arange(1,number_of_points+1, dtype=self.ensight_id_type))

            ndim = self.point_coordinates.shape[1]

            iii = 0
            while iii<ndim:
                f.write( self.point_coordinates[:,iii].ravel().astype(self.ensight_float_type) )  #x coord
                iii = iii+1

            #fill the rest with 0
            while iii<3:
                f.write( 0*self.point_coordinates[:,0].ravel().astype(self.ensight_float_type) )  #x coord
                iii = iii+1


            for elem_alya_id, elem_ensi_id in element_alya2ensi.items():
                #print("Saving elements ", elem_alya_id, " as ", elem_ensi_id)

                element_locations = np.where( self.element_types['tuples']==elem_alya_id )[0] #returns 2 sets, take first


                elements = self.connectivity[element_locations,0:elem_ensi_id['Vertices']]
                #print("Locations: ", element_locations)


                number_of_elements = elements.shape[0]
                #print("Number of elements = ",number_of_elements)


                f.write(elem_ensi_id['Name'].ljust(80))  #tetra4 or hexa8
                f.write( np.array([number_of_elements], dtype=self.ensight_id_type) )   #int
                f.write( np.array( element_locations, dtype=self.ensight_id_type)+1 )
                f.write( elements.ravel().astype(self.ensight_id_type) )


    def write_variable_pernode(self, var_name, data, inverse_pt_correspondence):
        fmt = '%s.ensi.'+var_name
        data2write = np.zeros((inverse_pt_correspondence.max()+1), dtype=self.ensight_float_type)
        data2write[inverse_pt_correspondence] = data
        print('Writing to '+os.path.join(outputfolder, fmt % (self.project_name)))
        with open( os.path.join(outputfolder, fmt % (self.project_name)), 'wb') as f:
            f.write(b'description line 1'.ljust(80))
            f.write(b'part'.ljust(80))
            f.write(np.array([1], dtype=self.ensight_id_type))   #int
            f.write(b'coordinates'.ljust(80))
            f.write(data2write)

### Main program
parser = argparse.ArgumentParser()
parser.add_argument("task_name", help='Name of the alya task')
parser.add_argument("input_folder", help='Folder with input alyabins')
parser.add_argument("output_folder", help='Folder for the output ensight case')
parser.add_argument("--format", help='Format of the data to expect: mpio, alyabin, auto(default)', default = 'auto')
parser.add_argument("t_start",help='Start time for calculation maps',default=0.0)
args = parser.parse_args()

inputfolder = args.input_folder
project_name = args.task_name
outputfolder = args.output_folder
t_start = float(args.t_start)

if args.format == 'alyabin':
    MPIO = False
elif args.format == 'mpio':
    MPIO = True
elif args.format == 'auto':
    #check what kind of files are present
    filename_mpio = os.path.join(inputfolder,project_name+'-LNODS.post.mpio.bin');
    filename_alyabin = os.path.join(inputfolder,project_name+'-LNODS.post.alyabin');
    mpio_file_present = os.path.isfile(filename_mpio)
    alyabin_file_present = os.path.isfile(filename_alyabin)
    assert mpio_file_present!=alyabin_file_present, "Found both alyabin and mpio files. Specify format to use in the --format argument"

    if mpio_file_present:
        MPIO = True
    else:
        MPIO = False

else:
    assert False, 'Unsupported format: '+str(args.format)

#check if input path exists
import pathlib
path = pathlib.Path(inputfolder)
assert path.exists(), input_folder + ' does not exist'

#create output folders
#path = pathlib.Path(outputfolder)
#if not path.exists:
#    path.mkdir()
if not os.path.exists(outputfolder):
    os.mkdir(outputfolder)


print('-------------------------------------------------------');
print('Alya task: '+str(project_name));
print('Input path: '+str(inputfolder));
print('Output path: '+str(outputfolder));
if MPIO:
    print('Format: MPIO');
else:
    print('Format: ALYABIN');
print('-------------------------------------------------------');

sys.stdout.flush()

if MPIO:
    file_suffix = '.post.mpio.bin'
else:
    file_suffix = '.post.alyabin'

iterationid_number_of_digits = 6  #how many digits to use for the iteration id in variable files

element_alya2ensi = {37:{'Name':b'hexa8','Vertices':8}, 30:{'Name':b'tetra4','Vertices':4}, \
                     32:{'Name':b'pyramid5','Vertices':5}, 34:{'Name':b'penta6','Vertices':6},\
                     10:{'Name':b'tria3','Vertices':3}, 12:{'Name':b'quad4','Vertices':4}}

alya_id_type = None
alya = Alya_output_parse(project_name)
alya_id_type = alya.identify_alya_id_type()

partition_filename = os.path.join(inputfolder,project_name+ '.post.alyapar')
with open(partition_filename) as f:
    partitions = np.fromstring(f.read(), dtype=alya_id_type, sep=' ')

#describes the mesh partitions
#partition_id,  NumberOfElementsInPartition,  NumberOfPointsInPartition, NumberOfBoundariesInPartition
partitions = np.reshape(partitions[1:],(partitions[0],4))
number_of_blocks = partitions.shape[0]

partitions = pandas.DataFrame(partitions, columns=['id','Elements','Points','Boundaries'])

with open(os.path.join(inputfolder, project_name + '.post.alyafil'), 'r') as f:
    field_filelist = f.read().splitlines()

field_filelist = [x.strip() for x in field_filelist if x.strip()!='']
new_field_filelist = []

fields = []
iteration_numbers = []
for filename in field_filelist:
    s1 = filename[len(project_name):].split('-');
    fields = fields + [s1[1]]
    iteration_numbers = iteration_numbers + [ int(s1[2].split('.')[0]) ]
    new_field_filelist = new_field_filelist + [filename]
variable_info = pandas.DataFrame({'field':fields, 'iteration':iteration_numbers,'filename':new_field_filelist})
variable_info['time_int'] = 0
variable_info['time_real'] = 0
variable_info['variabletype']=''
variable_info['association']=''
inverse_pt_correspondence = None
element_types = None

#read real time stimulation
with open(os.path.join(inputfolder, project_name + '.post.alyalog'), 'r') as f:
    data = f.readlines()
iters = []
times = []
for i in range(0, len(data)):
    if (data[i].split()[0] == 'START'):
        iters.append(data[i].split()[1])
        times.append(float(data[i].split()[2]))
iters = iters[1:]
times = times[1:]
#read correct element arrangement
LNINV = alya.read_alya_array(os.path.join(inputfolder,project_name+'-LNINV'+file_suffix), \
                            number_of_blocks)
inverse_pt_correspondence = (LNINV['tuples']-1).ravel(); #convert ids to python

#verify the point correspondence
max_id = inverse_pt_correspondence.max();
pt_ids = np.zeros(max_id+1)
pt_ids[inverse_pt_correspondence] = 1
assert not (LNINV['tuples']<0).any(), "Negative elements in LNINV, wrong mesh"
assert (pt_ids>0).all(), "Some points in the mesh do not have a correspondence in the partitions"
pt_ids = None #free memeory

LTYPE = alya.read_alya_array(os.path.join(inputfolder,project_name + '-LTYPE'+file_suffix), number_of_blocks)
element_types =    LTYPE['tuples'].ravel()
alya.read_geometry(inputfolder, file_suffix, number_of_blocks, partitions, inverse_pt_correspondence)


## Loop through files and read in

alya.actmap = np.zeros(alya.num_nodes_parallel)
alya.relmap = np.zeros(alya.num_nodes_parallel)
alya.maxamp = np.zeros(alya.num_nodes_parallel)
alya.maxfound = np.zeros(alya.num_nodes_parallel)
alya.vm0 = 0.0
alya.prev_time = 0.0
alya.prev_v = np.zeros(alya.num_nodes_parallel)
file_counter = 0
for index, row in variable_info.iterrows():
    if row.field == 'INTRA':
        if (times[file_counter] > t_start):
            input ={'filetype':'variable','name':row.field, \
                'iteration':row.iteration,'table_index':index,\
                'number_of_blocks':number_of_blocks, \
                'table_index':index}
            print(input)
            alya.read_file(input['name'], input['iteration'],input['number_of_blocks'], file_suffix, t_start)
        file_counter = file_counter + 1
alya.write_variable_pernode('ACTIV',alya.actmap, inverse_pt_correspondence)
alya.write_variable_pernode('RELAX',alya.relmap, inverse_pt_correspondence)
alya.write_geometry(outputfolder)
alya.write_case(outputfolder)
#alya.write_field(alya.actmap)



case_file = project_name+ '.ensi.case'
with open(os.path.join(outputfolder, case_file), 'w') as f:
    f.write('# Converted from Alya\n')
    f.write('# Ensight Gold Format\n')
    f.write('#\n')
    f.write('# Problem name: '+str(project_name)+'\n')
    f.write('FORMAT\n')
    f.write('type: ensight gold\n')
    f.write('\n')
    f.write('GEOMETRY\n')
    f.write('model: 1 '+str(project_name)+'.ensi.geo\n')
    f.write('\n')
    f.write('VARIABLE\n')
    f.write('scalar per node:\t1\tACTIV\t'+str(project_name)+'.ensi.ACTIV\n')
