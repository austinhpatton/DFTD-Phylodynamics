## Supplementary Scripts
This directory holds a number of scripts used in our publication investigating the phylodynamics of Devil Facial Tumor Disease (DFTD), a transmissible cancer threating the endanged Tasmanian devil.

### File Descriptions
1) AlignClustalO.sh - Runs Clustal Omega to generate our 'first-pass' multiple sequence alignments using consensus sequences of > 11K genes. These multiple sequence alignments were subsequently used to test for a clock-like signal (i.e. to asses utility for phylodynamic analysis). 
2) AlignMafft.slurm - Runs Mafft on genes identified to exhibit a strong clock-like signal - a more sensitive/comprehensive alignmenment approach is used here, as these multiple sequence alignments were to be used for all downstream phylodynamic analyses. 
3) ExtractGeneSequences-ForClockTesting.slurm - This script pulls out target genes from the somatic consensus sequences for each sample. These focal genes (per sample) then are concatenated into a single fasta file to later be aligned. 
4) GetFinalClockGenes.R - Parses the output from our test of clock-like signal, identifying those genes that meet our stringent criteria regarding suitability for phylodynamic analysis (strong clock-like signal, positive corrlation of root-to-tip distance, sensible MRCA, and sufficiently variable, >= 50 parsimony informative sites). It then returns a table with these summary statistics for each gene. 
5) Infer-ConcatStartTree - Infers a maximum likelihood tree from the concatened sequences of our final, clocklike genes using IQtree. This tree subsequently is used as a starting tree for bayesian phylogenetic inference to improve mixing and speed at which convergence is achieved. 
6) InferTrees-IqTree.slurm - Infers a maximum likelihood tree for the ~11K genes for which we conducted tests of clock-like signal.
7) MakeMPileup-VCF.slurm - Uses bcftools mpileup to call SNPs and Indels for all 56 tumor samples - these later are further processed using bcftools isec to exclude any variant that is shared between tumors and devils - this approach conservatively retains only mutations that are somatic in tumor samples. 
8) MakeSomaticConsensus.slurm - This script generates a single, haploid consensus sequence, assuming all sites to be the same as the reference, unless they are somatic mutations in the focal sample (i.e. unique to DFTD, not segregating in devil populations). 
9) Murray-et-al-rand_regression.R - Scripts originating from Murray & Welch 2015 (Methods in Ecol. & Evol.) to test for clock-like signal including randomization tests. 
10) Murray-et-al-tempsignalfunctions.R  - Functions originating from Murray & Welch 2015 (Methods in Ecol. & Evol.) that are called internally by Murray-et-al-rand_regression.R 
11) Reads2BamPipeline.slurm - Pipeline for pre-processing of raw reads, all the way to generation of bam files. 
12) Run-pFst.slurm - Script to calculate pFst (which incorporates genotype likelihoods to account for genotypic uncertainty) for each SNP across all tumor samples. Multiple versions of this analysis were run, so a single test is provided, calculating pFst among transmission clusters 1 and 2. 
13) Summarize-Alignments-AMAS.slurm - Runs AMAS (Borowiec 2016) to summarize multiple sequence alignments for which we tested clock-like signal. Summary statistics pertaining to number of parsimony informative sites, etc, were used to identify whether sequences would be retained for downstream analyses. 
14) Test-ClockLike-Signal.Rscript - calls the two Murray et al. scripts, and summarized the extent of clock-like signal for each gene - called by Test-ClockSignal.slurm to be run on a cluster. 
15) Test-ClockSignal.slurm - Script to submit Test-ClockLike-Signal.Rscript to be run on a cluster. 
