import numpy as np

fname = 'image_00001_5.npy'

data = np.load(fname)

print(data.shape)