from ECGPV_visualisation import *
import numpy
from matplotlib import pyplot as plt
from matplotlib.gridspec import GridSpec

a = ECGPV_visualisation(0.8)
ecgs = pickle.load(open('ecgs.pl', 'rb'), encoding='latin1')


def plot_ecg_to_specified_time(fig, ax, lead_name, t_end, counter):
    ax.clear()
    CL = 0.8
    beat = 3
    x_ = ecgs['ts'][beat-1]
    idx = [i for i,v in enumerate(x_) if v < t_end]
    x = x_[idx]
    xlabel = 'Time (s)'
    y_ = ecgs[lead_name+'s'][beat-1]/ecgs['max_all_leads']
    y = y_[idx]
    ylabel = lead_name
    ax.plot(x, y)
    ax.set_xlabel(xlabel)
    ax.set_ylabel(ylabel)
    print('setting ecg grids')
    a._set_ecg_ticks(ax, x_[-1], CL)
    ax.spines['top'].set_visible(False)
    ax.spines['right'].set_visible(False)
    ax.spines['bottom'].set_visible(False)
    ax.spines['left'].set_visible(False)
    ax.tick_params(left=False, right=False, top=False, bottom=False, labelleft=False, labelbottom=False)
    ax.set_xlim([0, numpy.ceil(x_[-1]/CL)*CL])
    plt.show(block = False)
    plt.savefig(lead_name+'_'+str(counter)+'.png')


# Get output times from .case file:
f = open('../displacement_local_strains/heart_remeshed_3D.ensi.case', 'r')
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

# Plot ECGs
matplotlib.rcParams.update({'font.size':'24'})
matplotlib.rcParams.update({'text.color':'black'})
matplotlib.rcParams.update({'lines.linewidth':'3'})
fig_size = [5, 5]
fig = plt.figure(tight_layout=True, figsize=fig_size)
gs = GridSpec(1,1)
ax = fig.add_subplot(gs[0,0])
times = times - times[0]
for i in range(0, len(times)):
    for k in [1, 2, 3, 4, 5, 6]:
        plot_ecg_to_specified_time(fig, ax, 'V'+str(k), times[i], i)
