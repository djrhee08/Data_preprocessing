#!/bin/bash

dir_training='training'
dir_validation='validation'

if [ ! -e "$dir_training" ]; then
    mkdir $dir_training
fi

if [ ! -e "$dir_validation" ]; then
    mkdir $dir_validation
fi

for file in *.npy;
do
    echo $file
    if (( $(($RANDOM % 100)) < 79 )); then # 80% training 20% validation
        mv $file ./training
    else
        mv $file ./validation
    fi
done

img='image_'
training_image='./training/image_slice_index.dat'
training_mask='./training/mask_slice_index.dat'

if [ -e "$training_image" ]; then
    rm $training_image
fi

if [ -e "$training_mask" ]; then
    rm $training_mask
fi

for file in ./training/*.npy;
do
    fname=$(basename $file)
    fname2=$(echo $fname | rev | cut -d'_' -f 1-2 | rev)
    imgname=$img$fname2
    echo $fname

    echo $fname >> $training_mask
    echo $imgname >> $training_image
done


validation_image='./validation/image_slice_index.dat'
validation_mask='./validation/mask_slice_index.dat'

if [ -e "$validation_image" ]; then
    rm $validation_image
fi

if [ -e "$validation_mask" ]; then
    rm $validation_mask
fi

for file in ./validation/*.npy;
do
    fname=$(basename $file)
    fname2=$(echo $fname | rev | cut -d'_' -f 1-2 | rev)
    imgname=$img$fname2
    echo $fname

    echo $fname >> $validation_mask
    echo $imgname >> $validation_image
done
