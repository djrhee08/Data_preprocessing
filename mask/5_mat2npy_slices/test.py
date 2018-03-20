import numpy as np

fname = 'Brain_mask_MDA223_1.npy'

data = np.load(fname)

print(data.shape)