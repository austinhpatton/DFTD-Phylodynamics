#!/bin/bash

#SBATCH --partition=kamiak
#SBATCH --cpus-per-task=1
#SBATCH --job-name=Alignments
#SBATCH --array=1-364
#SBATCH --output=MakeFa.out 
#SBATCH --error=MakeFa_%A_%a.err
#SBATCH --time=4-00:00:00

module load samtools/1.9

#Here we are pulling out the target sample from the consensus fastas for each sample, and then concatenating them all into unaligned fastas. These will subsequently be aligned for tree interence and testing of clocklike signal. 
# CandidateGeneIntervals.txt is simple bed file listing the intervals of the genes to be tested. 
reg=$(sed -n ''$SLURM_ARRAY_TASK_ID'p' CandidateGeneIntervals.txt)

Ens=$(echo $reg | cut -d ' ' -f1)
gene=$(echo $reg | cut -d ' ' -f5)
begin=$(echo $reg | cut -d ' ' -f3)
end=$(echo $reg | cut -d ' ' -f4)

while read samp
do
    samtools faidx -c -n 100000 /data/storfer/DevilPhylo/IndSamp_Consensus/Fastas/${samp}.fa ${gene}:${begin}-${end} > ./Unaligned/${samp}-${Ens}.fa
    grep -v "^>" ./Unaligned/${samp}-${Ens}.fa | awk 'BEGIN { ORS=""; print "\n>'"${samp}"'\n" } { print }' > Unaligned/${samp}-${Ens}.tmp && mv Unaligned/${samp}-${Ens}.tmp Unaligned/${samp}-${Ens}.fa
    cat ./Unaligned/${samp}-${Ens}.fa >> ./Unaligned/${Ens}.fa
    rm ./Unaligned/${samp}-${Ens}.fa
done < Samples.txt

tail -n +2 Unaligned/${Ens}.fa > Unaligned/${Ens}.tmp && mv Unaligned/${Ens}.tmp Unaligned/${Ens}.fa

awk 'FNR==NR { array[$1]=$2; next } { for (i in array) gsub(i, array[i]) }1' SampleRename.txt ./Unaligned/${Ens}.fa > ./Unaligned/${Ens}-Renamed.fa

