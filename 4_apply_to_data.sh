#!/bin/bash

vcfFile=preCookedData/CEU50.chr2LCT.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz
fvecFile=CEU50.chr2LCT.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.fvec

# The command below calculates feature vectors on a vcf file
# To see how it works, type:
# python3 ~/libraries/diploSHIC/diploSHIC.py fvecVcf -h
# It is a bit involved so for now we are going to skip this step:
# python3 ~/libraries/diploSHIC/diploSHIC.py fvecVcf haploid $vcfFile 2 243199373 $fvecFile --ancFileName preCookedData/chr2.anc.fa &> realfvec.log

# Instead, let's cheat
zcat preCookedData/$fvecFile.gz > $fvecFile

python3 ~/libraries/diploSHIC/diploSHIC.py predict clf.json clf.weights.hdf5 $fvecFile real_preds.txt &> real_preds.log
