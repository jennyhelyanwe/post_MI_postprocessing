import numpy
import pickle
import struct
import sys

t_start = float(sys.argv[1])
t_end = float(sys.argv[2])
f = open('heart_remeshed_3D.ensi.case', 'r')
line = f.readline()
while line != 'TIME\n':
    line = f.readline()
line = f.readline()
time_set = line.split()[-1]
line = f.readline()
number_of_steps = float(line.split()[-1])
line = f.readline()
file_numbers = []
while len(file_numbers) < number_of_steps:
    line = f.readline()
    for i in range(0, len(line.split())):
        file_numbers.append(int(line.split()[i]))
junk = f.readline()
times = []
while len(times) < number_of_steps:
    line = f.readline()
    for i in range(0, len(line.split())):
        times.append(float(line.split()[i]))
times = numpy.array(times)
file_numbers = numpy.array(file_numbers)


def read_scalar_per_node(filename):
    with open(filename, 'rb') as f:
		data = f.read() 

    out = []
    for i in numpy.arange(244, len(data), 4):
        out.append(struct.unpack("f", data[i:(i+4)])[0])
    out = numpy.array(out)
    return out

start_idx = numpy.where(times > t_start)[0][0]
end_idx = numpy.where(times < t_end)[0][-1]
meshname = 'heart_remeshed_3D'
local = pickle.load(open('local.p', 'r'))

for i in range(start_idx, end_idx):
    exx = read_scalar_per_node(meshname + '.ensi.EPSXX-'+str(file_numbers[i]).zfill(6))
    eyy = read_scalar_per_node(meshname + '.ensi.EPSYY-'+str(file_numbers[i]).zfill(6))
    ezz = read_scalar_per_node(meshname + '.ensi.EPSZZ-'+str(file_numbers[i]).zfill(6))
    exy = read_scalar_per_node(meshname + '.ensi.EPSXY-'+str(file_numbers[i]).zfill(6))
    eyz = read_scalar_per_node(meshname + '.ensi.EPSYZ-'+str(file_numbers[i]).zfill(6))
    exz = read_scalar_per_node(meshname + '.ensi.EPSXZ-'+str(file_numbers[i]).zfill(6))

    elong = meshname + '.ensi.EPSLO-'+str(file_numbers[i]).zfill(6)
    ecirc = meshname + '.ensi.EPSCI-'+str(file_numbers[i]).zfill(6)
    erad = meshname + '.ensi.EPSRA-'+str(file_numbers[i]).zfill(6)
    print 'Writing to', elong, ecirc, erad
    fid_long = open(str(elong),'w')
    fid_long.write('Alya Ensight Gold --- Scalar per-node variables file\npart\n   1\ncoordinates\n')

    fid_circ = open(str(ecirc),'w')
    fid_circ.write('Alya Ensight Gold --- Scalar per-node variables file\npart\n   1\ncoordinates\n')

    fid_rad = open(str(erad),'w')
    fid_rad.write('Alya Ensight Gold --- Scalar per-node variables file\npart\n   1\ncoordinates\n')

    for n in range(0, len(exx)):
        e_tensor = numpy.array([[exx[n], exy[n],exz[n]], 
                                [exy[n], eyy[n],eyz[n]],
                                [exz[n], eyz[n],ezz[n]]])
        circ = local[n][0:3]
        longi = local[n][3:6]
        rad = local[n][6:9]
        e_circ = numpy.dot(numpy.dot(e_tensor,circ),circ)
        e_long = numpy.dot(numpy.dot(e_tensor,longi),longi)
        e_rad = numpy.dot(numpy.dot(e_tensor,rad),rad)
        fid_circ.write(str(e_circ)+'\n')
        fid_long.write(str(e_long)+'\n')
        fid_rad.write(str(e_rad)+'\n')
    fid_circ.close()
    fid_long.close()
    fid_rad.close()

