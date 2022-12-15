from matplotlib import pyplot as plt
import matplotlib
import pandas as pd
import numpy as np

node0 = np.array(pd.read_csv('probe_nodes0.csv')['INTRA'])
node1 = np.array(pd.read_csv('probe_nodes1.csv')['INTRA'])
node2 = np.array(pd.read_csv('probe_nodes2.csv')['INTRA'])
node3 = np.array(pd.read_csv('probe_nodes3.csv')['INTRA'])
t = np.array(pd.read_csv('probe_nodes1.csv')['Time'])*1000.0

idx = np.where(t>1010)[0][0]

# Generate vertical lines to match figure
t_60ms = np.full(idx, 60)
t_510ms = np.full(idx, 510)
t_610ms = np.full(idx, 610)
t_710ms = np.full(idx, 710)
t_810ms = np.full(idx, 810)
t_910ms = np.full(idx, 910)
t_1010ms = np.full(idx, 1010)

line = np.linspace(-100, 50, len(t_60ms))
matplotlib.rcParams.update({'font.size':'12'})
matplotlib.rcParams.update({'text.color':'black'})
matplotlib.rcParams.update({'lines.linewidth':'3'})
fig = plt.figure(figsize=[15,2.5])
plt.plot(t[:idx], node0[:idx],'r-', t[:idx], node1[:idx], 'm-', t[:idx], node2[:idx], 'g-',t[:idx], node3[:idx], 'y-', t_60ms, line, 'k:',t_510ms, line, 'k:',t_610ms, line, 'k:',t_710ms, line, 'k:',t_810ms, line, 'k:',t_910ms, line, 'k:',t_1010ms, line, 'k:')
plt.ylim([-100, 50])
plt.xlim([0, 1020])
plt.savefig('probe_nodes.png')
#plt.show()
