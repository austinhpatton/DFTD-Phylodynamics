#!/bin/bash

#SBATCH --partition=kamiak
#SBATCH --job-name=pFst-12
#SBATCH --out=pfst-12.out

# As an example, just comparing between clusters 1 and 2. 
~/vcflib/bin/pFst --file ../pFst-FinalDat-2.recode.vcf --type PL --deltaaf 0.1 --target 1,2,20,21,26,47,49,50 --background 4,6,7,8,10,11,14,15,16,18,22,23,25,27,28,31,32,33,36,37,38,42,43,48,51 > pFst-12.res
