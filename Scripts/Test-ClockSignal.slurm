#!/bin/bash

#SBATCH --partition=kamiak
#SBATCH --cpus-per-task=1
#SBATCH --job-name=ClockSig
#SBATCH --array=1-364
#SBATCH --out=ClockSignal.log

# Run Rscript that tests for clocklike signal for all genes. 
module load r/3.6.0

R CMD BATCH Test-ClockLike-Signal.Rscript
