#!/bin/bash

#SBATCH --partition=kamiak
#SBATCH --cpus-per-task=1
#SBATCH --job-name=iqtree
#SBATCH --array=1-364
#SBATCH --out=iqtree-out.log

#Sets a variable name as the first column of an input file (FinishedAlignments.txt) that lists paths to all MSAs.

file=$(sed -n ''$SLURM_ARRAY_TASK_ID'p' ./FinishedAlignments.txt | awk '{print$1}')

# Now run IQ tree, testing models of nucleotide substitution in the process to improve model adequacy for tree inference. 
cd GeneTrees

~/iqtree-1.6.12-Linux/bin/iqtree -s ../$file -nt 1 -m TEST
