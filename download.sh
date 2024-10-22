#!/bin/bash

"""
StarGAN v2
Copyright (c) 2020-present NAVER Corp.

This work is licensed under the Creative Commons Attribution-NonCommercial
4.0 International License. To view a copy of this license, visit
http://creativecommons.org/licenses/by-nc/4.0/ or send a letter to
Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
"""

FILE=$1

if [ "$FILE" == "pretrained-network" ]; then
    URL="https://www.dropbox.com/scl/fi/akxt03k63b7qb0g5ca69m/010000_nets_ema.ckpt?rlkey=i3pkqmsdsyfimwmnoo82dx7a5&st=o8g2lqgo&dl=1"
    mkdir -p ./expr/checkpoints/celeba_hq
    OUT_FILE=./expr/checkpoints/celeba_hq/010000_nets_ema.ckpt
    wget -N "$URL" -O "$OUT_FILE"
    
elif [ "$FILE" == "wing" ]; then
    URL="https://www.dropbox.com/s/tjxpypwpt38926e/wing.ckpt?dl=1"
    mkdir -p ./expr/checkpoints/
    OUT_FILE=./expr/checkpoints/wing.ckpt
    wget -N "$URL" -O "$OUT_FILE"
    
    URL="https://www.dropbox.com/s/91fth49gyb7xksk/celeba_lm_mean.npz?dl=1"
    OUT_FILE=./expr/checkpoints/celeba_lm_mean.npz
    wget -N "$URL" -O "$OUT_FILE"

elif [ "$FILE" == "celeba-hq-dataset" ]; then
    URL="https://www.dropbox.com/s/f7pvjij2xlpff59/celeba_hq.zip?dl=1"
    ZIP_FILE=./data/celeba_hq.zip
    mkdir -p ./data
    wget -N "$URL" -O "$ZIP_FILE"
    unzip "$ZIP_FILE" -d ./data
    rm "$ZIP_FILE"

else
    echo "Available arguments are 'pretrained-network', 'wing', and 'celeba-hq-dataset'."
    exit 1

fi
