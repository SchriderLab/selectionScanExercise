#!/bin/bash

# first create a directory to stash our training set
mkdir -p trainingSet

# then set a path to our diploSHIC script to shrink our commands a bit
diploShicPath="$HOME/libraries/diploSHIC/diploSHIC.py"

# step 1: build our training set
python3 $diploShicPath makeTrainingSets trainingFvecs/neut.fvec trainingFvecs/soft_ trainingFvecs/hard_ 5 0,1,2,3,4,6,7,8,9,10 trainingSet/

# step 2: train our classifier
python3 $diploShicPath train trainingSet/ trainingSet/ clf
