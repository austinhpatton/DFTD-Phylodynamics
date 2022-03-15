#!/bin/bash

#SBATCH --partition=storfer
#SBATCH --cpus-per-task=1
#SBATCH --job-name=Summ-aln-ap
#SBATCH --mem=100000
#SBATCH --out=Summ-Aln.out

module load python3 

# Finished files need to be broken up into chunks first as the memory management of AMAS is not optimized to handle this volume of data.  
python3 ~/AMAS/amas/AMAS.py summary -c 15 -f fasta -d dna -i Aligned/*FINAL.fa -o Mafft-Alignments-Summary.txt
