#!/bin/bash

#SBATCH --partition=kamiak
#SBATCH --cpus-per-task=20
#SBATCH --job-name=iqtree
#SBATCH --out=iqtree-out.log

# Now run IQ tree, testing models of nucleotide substitution in the process to improve model adequacy for tree inference. 
# The input alignment here is the full concatenated sequence of all clocklike genes. 
~/iqtree-1.6.12-Linux/bin/iqtree -s Final-Clock-Genes-Concat.fa -bb 1000 -nt 20 -m TEST
