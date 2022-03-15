#!/bin/bash

#SBATCH --partition=storfer
#SBATCH --cpus-per-task=1
#SBATCH --job-name=MakeCons
#SBATCH --array=1-55
#SBATCH --time=14-00:00:00
#SBATCH --output=MakeCons_%A_%a.out 
#SBATCH --error=MakeCons_%A_%a.err

module load htslib
module load samtools

name=$(sed -n ''$SLURM_ARRAY_TASK_ID'p' Samps4Consensus.txt | awk '{print$1}')
path=$(sed -n ''$SLURM_ARRAY_TASK_ID'p' Samps4Consensus.txt | awk '{print$2}')

~/bcftools-1.9/bcftools index -f ./VCFs/${name}.vcf.gz

mkdir ${name}-Isec

~/bcftools-1.9/bcftools isec -p ./${name}-Isec ./VCFs/${name}.vcf.gz /data/storfer/DevilPhylo/Analyses/Data/HardFilt_RefSites/WG-Paired-Host-Sites.vcf.gz

bgzip ./${name}-Isec/0000.vcf

~/bcftools-1.9/bcftools index -f ./${name}-Isec/0000.vcf.gz

~/bcftools-1.9/bcftools norm -f /data/storfer/Murchison_reference/sarHar1.fa -m +any ./${name}-Isec/0000.vcf.gz -Oz -o ./VCFs/${name}.norm.vcf.gz

~/bcftools-1.9/bcftools index -f ./VCFs/${name}.norm.vcf.gz

~/bcftools-1.9/bcftools consensus --fasta-ref /data/storfer/Murchison_reference/sarHar1.fa ./VCFs/${name}.norm.vcf.gz > ./Fastas/${name}.fa

samtools faidx ./Fastas/${name}.fa

