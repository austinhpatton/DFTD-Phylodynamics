# cbSKY Analysis
# We begin in tracer, using the combined log file to conduct the actual 
# (stepwise) analysis.
# We are simply plotting the demography produced as a tsv from that analysis

setwd('~/Dropbox/Research/Devils/WG-Phylodynamics/Analyses-FINAL/cbSKY/')

res <- read.table('Final-Clock-Genes-cbSKY-Combined-Demography.txt', 
                  header = T, sep = '\t')

library(ggplot2)
library(ggpubr)

res <- res[-nrow(res),]
res$Year <- res$Time

pdf('cbSKY-EffNumInfections-Demography.pdf', width = 7, height = 5)
ggplot(data = res, aes(x = Year), 
       ylim(c(0, max(res$Upper)))) + 
  geom_ribbon(aes(ymin = Lower, 
                  ymax = Upper), 
              fill = pal.dark(cblue),
              alpha = 0.25) +
  geom_line(aes(y = Median), size = 1.1) +
  geom_line(aes(y = Upper)) +
  geom_line(aes(y = Lower)) +
  ylab('Effective Number of Infections') +
  scale_x_log10() +
  scale_y_log10() +
  theme_bw()
dev.off()

tt <- read.table('~/TreeTime/TreeTime-Relaxed/skyline.tsv', header = T)

pdf('~/TreeTime/TreeTime-Relaxed/TreeTime-EffNumInfections-Demography.pdf', width = 7, height = 5)
colnames(tt) <- c('Year', 'Median', 'Lower', 'Upper')
ggplot(data = tt, aes(x = Year), 
       ylim(c(0, max(res$Upper)))) + 
  geom_ribbon(aes(ymin = Lower, 
                  ymax = Upper), 
              fill = pal.dark(cblue),
              alpha = 0.25) +
  geom_line(aes(y = Median), size = 1.1) +
  geom_line(aes(y = Upper)) +
  geom_line(aes(y = Lower)) +
  ylab('Effective Number of Infections') +
  scale_y_log10() +
  theme_bw()
dev.off()
  