import pickle
import numpy
import scipy
from scipy import io

ecgs = pickle.load(open('ecgs.pl', 'rb'), encoding='latin1')
print ('Reading pickled file...')
t = ecgs['t']
idx_end = int(numpy.floor(max(t)*1000))
V1 = []
V2 = []
V3 = []
V4 = []
V5 = []
V6 = []
I = []
II = []
III = []
aVL = []
aVR = []
aVF = []
ts = []
for i in range(0, idx_end):
    current_t = i/1000
    ts.append(current_t)
    idx = numpy.where(abs(t -current_t) == min(abs(t-current_t)))[0][0]
    V1.append(ecgs['V1'][idx])
    V2.append(ecgs['V2'][idx])
    V3.append(ecgs['V3'][idx])
    V4.append(ecgs['V4'][idx])
    V5.append(ecgs['V5'][idx])
    V6.append(ecgs['V6'][idx])
    I.append(ecgs['I'][idx])
    II.append(ecgs['II'][idx])
    III.append(ecgs['III'][idx])
    aVL.append(ecgs['aVL'][idx])
    aVR.append(ecgs['aVR'][idx])
    aVF.append(ecgs['aVF'][idx])
print ('Saving as .mat...')
resampled_ecgs = {'t': ts, 'V1':V1, 'V2':V2,'V3':V3, 'V4':V4, 'V5':V5, 'V6':V6, 'I':I, 'II':II, 'III':III, 'aVL':aVL, 'aVR':aVR, 'aVF':aVF }
scipy.io.savemat('ecgs.mat', resampled_ecgs)
