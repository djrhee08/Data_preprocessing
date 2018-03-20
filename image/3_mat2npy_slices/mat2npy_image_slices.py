import scipy.io as sio
import numpy as np
import glob, os


with open('image_slice_index.dat','w') as index_file:
    for fname in glob.glob('*.mat'):
        print(fname)

        a = sio.loadmat(fname)
        image = a['img']

        print(image.shape)

        num_slices = image.shape[0]

        image_name = fname.split(".")
        image_name = image_name[0]

        for i in range(num_slices):
            slice = image[i,:,:]
            slice_name = image_name + '_' + str(i) + '.npy'

            np.save(slice_name, slice)
            #print(slice_name)
            index_file.write(slice_name+'\n')
