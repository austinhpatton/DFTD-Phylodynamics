#!/usr/bin/Rscript

# This script simply runs through the summary file produced by AMAS and reduces down to a final list (FinalClockGenesSumm.tsv) the set of genes that meets the specified criteria.  
# "Combine-ClockSig-SiteSumm-RESULTS.txt" is the file produced from the analysis that uses the scripts from Murray et al. 2017, that lists the evidence of clocklike signal for each gene that is tested. 

res <- read.table('ClockSignal/Combine-ClockSig-SiteSumm-RESULTS.txt', header = T, sep = ' ', row.names=1)

res1 <- res[which(res$r > 0.0),]
res2 <- res1[which(res1$Pval < 0.05),]
res3 <- res2[which(res2$MRCA < 200),]
res4 <- res3[which(res3$Num.Pars.Inform >= 50),]

res4 <- res4[-1,]

write.table(res4, 'FinalClockGenesSumm.tsv', sep ='\t')
