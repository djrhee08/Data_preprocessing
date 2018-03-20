import scipy.io as sio
import numpy as np
import glob, os


with open('mask_slice_index.dat','w') as mask_index_file, open('image_slice_index.dat','w') as image_index_file:
    for fname in glob.glob('*.mat'):
        print(fname)

        a = sio.loadmat(fname)
        mask1 = a['mask']
        mask = mask1['data'].item(0)

        print(mask.shape)

        num_slices = mask.shape[0]

        mask_name = fname.split(".")
        mask_name = mask_name[0]

        for i in range(num_slices):
            slice = mask[i,:,:]

            # omit any 0 slices
            if np.sum(slice.flatten()) != 0:
                slice_name = mask_name + '_' + str(i) + '.npy'
                image_name_temp = slice_name.split("_")[-2:]
                image_slice_name = 'image_' + image_name_temp[0] + "_" + image_name_temp[1]
                #print(mask_name, image_slice_name, slice_name)

                #np.save(slice_name, slice)
                mask_index_file.write(slice_name+'\n')
                image_index_file.write(image_slice_name+'\n')