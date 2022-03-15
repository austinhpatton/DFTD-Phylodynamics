#!/bin/bash

#SBATCH --partition=kamiak
#SBATCH --cpus-per-task=2
#SBATCH --job-name=mafft
#SBATCH --array=1-364
#SBATCH --output=mafft.out 
#SBATCH --error=mafft_%A_%a.err
#SBATCH --time=7-00:00:00
#SBATCH --mem=250000

module load mafft

Ens=$(sed -n ''$SLURM_ARRAY_TASK_ID'p' IntervalsToAlign.txt | awk '{print$1}')

mafft --thread 4 --localpair --maxiterate 1000 --nomemsave ./Unaligned/${Ens}-Renamed.fa > ./Aligned/${Ens}-MSA-Mafft-Aln.fa
linsi ./Aligned/${Ens}-MSA-Mafft-Aln.fa > ./Aligned/${Ens}-MSA-Mafft-FINAL.fa
