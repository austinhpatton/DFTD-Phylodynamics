 #!/bin/bash
#SBATCH --partition=storfer
#SBATCH --job-name=Bam2VCF
#SBATCH --ntasks=1
#SBATCH --cpus-per-task 1
#SBATCH --array=1-3
#SBATCH --output=Mpileup_%A_%a.out 
#SBATCH --error=Mpileup_%A_%a.err
#SBATCH --time=7-00:00:00

# This simply calls variants from per-sample bam files to produce per-sample vcfs. 
bam="$(sed "${SLURM_ARRAY_TASK_ID}q;d" Bams.txt)"
name="$(sed "${SLURM_ARRAY_TASK_ID}q;d" Samps.txt)"

~/bcftools-1.9/bcftools mpileup -Ou -f /data/storfer/Murchison_reference/sarHar1.fa $bam | ~/bcftools-1.9/bcftools call -mv -Oz -o  ${name}.vcf.gz
