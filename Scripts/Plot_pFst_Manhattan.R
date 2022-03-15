# Plot pFst
######################## 1 - 2 #########################
library(ggplot2)
library(data.table)
library(stringr)

setwd('~/Dropbox/Research/Devils/WG-Phylodynamics/Analyses-FINAL/pFST/Compare-12/')

dat <-read.table(file = 'pFst-12.res', header=FALSE)

chr1 <- dat[dat$V1 %like% "chr1", ]
chr1$ChrCol <- 'a'
chr2 <- dat[dat$V1 %like% "chr2", ]
chr2$ChrCol <- 'b'
chr3 <- dat[dat$V1 %like% "chr3", ]
chr3$ChrCol <- 'a'
chr4 <- dat[dat$V1 %like% "chr4", ]
chr4$ChrCol <- 'b'
chr5 <- dat[dat$V1 %like% "chr5", ]
chr5$ChrCol <- 'a'
chr6 <- dat[dat$V1 %like% "chr6", ]
chr6$ChrCol <- 'b'
chrX <- dat[dat$V1 %like% "chrX", ]
chrX$ChrCol <- 'a'

dat <- rbind(chr1, chr2, chr3, chr4, chr5, chr6, chrX)

quants0.001 <- quantile(dat$V3, c(0.001, 0.999))
quants0.0001 <- quantile(dat$V3, c(0.0001, 0.9999))


# All Chromosomes
dat$V4 <- 1:length(dat$V2)
top0.001 <- dat[which(dat$V3 <= quants0.001[[1]]),]
top0.0001 <- dat[which(dat$V3 <= quants0.0001[[1]]),]

dat <- dat[dat$V3 < 0.1,]

breaks <- c(nrow(chr1), 
            nrow(chr1) + nrow(chr2),
            nrow(chr1) + nrow(chr2) + nrow(chr3),
            nrow(chr1) + nrow(chr2) + nrow(chr3) + nrow(chr4),
            nrow(chr1) + nrow(chr2) + nrow(chr3) + nrow(chr4) + 
              nrow(chr5),
            nrow(chr1) + nrow(chr2) + nrow(chr3) + nrow(chr4) + 
              nrow(chr5) + nrow(chr6),
            nrow(chr1) + nrow(chr2) + nrow(chr3) + nrow(chr4) + 
              nrow(chr5) + nrow(chr6) + nrow(chrX))

pdf('pFst-Clusters-1-2.pdf', width = 20, height = 4)
dat.p.12 <-
  ggplot(dat, aes(x=V4, y=-log10(V3))) +
  geom_point(size = 0.5, alpha = 0.4, aes(color = ChrCol)) +
  geom_point(data = top0.001, aes(x=V4, y=-log10(V3)),
             size = 0.75, alpha = 0.75, color = '#2b83ba') +
  geom_point(data = top0.0001, aes(x=V4, y=-log10(V3)),
             size = 1, color = '#d7191c') +
  scale_x_continuous(name="Chromosome", 
                     breaks=breaks, 
                     labels=c("1", "2", "3", "4", "5", "6", "X")) + 
  scale_color_grey(end = 0.6) +
  theme_pubr(15) +
  theme(legend.position = "none") +
  labs(x="SNP index", y="-log10(pFst)")
dat.p.12
dev.off()

top0.001 <- top0.001[,-c(4,5)]

GL.id <- str_split_fixed(top0.001$V1, '_', 3)[,2]
pos <- top0.001$V2
top.sites <- paste0(GL.id, '.1:', pos)

write.table(top0.001, 'Top-0.1Perc-pFst-1-2-Snps.txt', sep = ' ',
            quote = F, row.names = F, col.names = F)

write.table(top.sites, 'Top-0.1Perc-pFst-1-2-Positions.txt', sep = ' ',
            quote = F, row.names = F, col.names = F)


top0.0001 <- top0.0001[,-c(4,5)]

GL.id <- str_split_fixed(top0.0001$V1, '_', 3)[,2]
pos <- top0.0001$V2
top.sites <- paste0(GL.id, '.1:', pos)

write.table(top0.0001, 'Top-0.01Perc-pFst-1-2-Snps.txt', sep = ' ',
            quote = F, row.names = F, col.names = F)

write.table(top.sites, 'Top-0.01Perc-pFst-1-2-Positions.txt', sep = ' ',
            quote = F, row.names = F, col.names = F)

######################## 1 - 3 #########################

setwd('~/Dropbox/Research/Devils/WG-Phylodynamics/Analyses-FINAL/pFST/Compare-13/')

dat <-read.table(file = 'pFst13.res', header=FALSE)

chr1 <- dat[dat$V1 %like% "chr1", ]
chr1$ChrCol <- 'a'
chr2 <- dat[dat$V1 %like% "chr2", ]
chr2$ChrCol <- 'b'
chr3 <- dat[dat$V1 %like% "chr3", ]
chr3$ChrCol <- 'a'
chr4 <- dat[dat$V1 %like% "chr4", ]
chr4$ChrCol <- 'b'
chr5 <- dat[dat$V1 %like% "chr5", ]
chr5$ChrCol <- 'a'
chr6 <- dat[dat$V1 %like% "chr6", ]
chr6$ChrCol <- 'b'
chrX <- dat[dat$V1 %like% "chrX", ]
chrX$ChrCol <- 'a'

dat <- rbind(chr1, chr2, chr3, chr4, chr5, chr6, chrX)

quants0.001 <- quantile(dat$V3, c(0.001, 0.999))
quants0.0001 <- quantile(dat$V3, c(0.0001, 0.9999))

# All Chromosomes
dat$V4 <- 1:length(dat$V2)
top0.001 <- dat[which(dat$V3 <= quants0.001[[1]]),]
top0.0001 <- dat[which(dat$V3 <= quants0.0001[[1]]),]

dat <- dat[dat$V3 < 0.1,]

# NFATC3 - chr1_GL834763_random	723522
# PRKG1 - chr1_GL834438_random	1406785
# SPPL3 - chr2_GL841443_random	1776709
# ARMC8 - chr3_GL849591_random	361567
# CDH17 - chr2_GL841366_random	2228129
# DMXL1 - chr2_GL841465_random	74435
# PKP2 - chr5_GL861755_random	85588

focal <- c(which(dat$V2 == 723522), which(dat$V2 == 1406785),
           which(dat$V2 == 1776709), which(dat$V2 == 361567),
           which(dat$V2 == 2228129), which(dat$V2 == 74435),
           which(dat$V2 == 85588))

focal <- dat[focal,]

breaks <- c(nrow(chr1), 
            nrow(chr1) + nrow(chr2),
            nrow(chr1) + nrow(chr2) + nrow(chr3),
            nrow(chr1) + nrow(chr2) + nrow(chr3) + nrow(chr4),
            nrow(chr1) + nrow(chr2) + nrow(chr3) + nrow(chr4) + 
              nrow(chr5),
            nrow(chr1) + nrow(chr2) + nrow(chr3) + nrow(chr4) + 
              nrow(chr5) + nrow(chr6),
            nrow(chr1) + nrow(chr2) + nrow(chr3) + nrow(chr4) + 
              nrow(chr5) + nrow(chr6) + nrow(chrX))

pdf('pFst-Clusters-1-3.pdf', width = 20, height = 4)
dat.p.13 <-
  ggplot(dat, aes(x=V4, y=-log10(V3))) +
  geom_point(size = 0.5, alpha = 0.4, aes(color = ChrCol)) +
  geom_point(data = top0.001, aes(x=V4, y=-log10(V3)),
             size = 0.75, alpha = 0.75, color = '#2b83ba') +
  geom_point(data = top0.0001, aes(x=V4, y=-log10(V3)),
             size = 1, color = '#d7191c') +
  scale_x_continuous(name="Chromosome", 
                     breaks=breaks, 
                     labels=c("1", "2", "3", "4", "5", "6", "X")) + 
  scale_color_grey(end = 0.6) +
  theme_pubr(15) +
  theme(legend.position = "none") +
  labs(x="SNP index", y="-log10(pFst)")
dat.p.13
dev.off()

top0.001 <- top0.001[,-c(4,5)]

GL.id <- str_split_fixed(top0.001$V1, '_', 3)[,2]
pos <- top0.001$V2
top.sites <- paste0(GL.id, '.1:', pos)

write.table(top0.001, 'Top-0.1Perc-pFst-1-3-Snps.txt', sep = ' ',
            quote = F, row.names = F, col.names = F)

write.table(top.sites, 'Top-0.1Perc-pFst-1-3-Positions.txt', sep = ' ',
            quote = F, row.names = F, col.names = F)



top0.0001 <- top0.0001[,-c(4,5)]

GL.id <- str_split_fixed(top0.0001$V1, '_', 3)[,2]
pos <- top0.0001$V2
top.sites <- paste0(GL.id, '.1:', pos)

write.table(top0.0001, 'Top-0.01Perc-pFst-1-3-Snps.txt', sep = ' ',
            quote = F, row.names = F, col.names = F)

write.table(top.sites, 'Top-0.01Perc-pFst-1-3-Positions.txt', sep = ' ',
            quote = F, row.names = F, col.names = F)


######################## 3 - 2 #########################

setwd('~/Dropbox/Research/Devils/WG-Phylodynamics/Analyses-FINAL/pFST/Compare-32/')

dat <-read.table(file = 'pFst-32.res', header=FALSE)

chr1 <- dat[dat$V1 %like% "chr1", ]
chr1$ChrCol <- 'a'
chr2 <- dat[dat$V1 %like% "chr2", ]
chr2$ChrCol <- 'b'
chr3 <- dat[dat$V1 %like% "chr3", ]
chr3$ChrCol <- 'a'
chr4 <- dat[dat$V1 %like% "chr4", ]
chr4$ChrCol <- 'b'
chr5 <- dat[dat$V1 %like% "chr5", ]
chr5$ChrCol <- 'a'
chr6 <- dat[dat$V1 %like% "chr6", ]
chr6$ChrCol <- 'b'
chrX <- dat[dat$V1 %like% "chrX", ]
chrX$ChrCol <- 'a'

dat <- rbind(chr1, chr2, chr3, chr4, chr5, chr6, chrX)

quants0.001 <- quantile(dat$V3, c(0.001, 0.999))
quants0.0001 <- quantile(dat$V3, c(0.0001, 0.9999))


# All Chromosomes
dat$V4 <- 1:length(dat$V2)
top0.001 <- dat[which(dat$V3 <= quants0.001[[1]]),]
top0.0001 <- dat[which(dat$V3 <= quants0.0001[[1]]),]

dat <- dat[dat$V3 < 0.1,]

# SPPL3 - chr2_GL841443_random	1776709

focal <- c(which(dat$V2 == 1776709))
focal <- dat[focal,]

breaks <- c(nrow(chr1), 
            nrow(chr1) + nrow(chr2),
            nrow(chr1) + nrow(chr2) + nrow(chr3),
            nrow(chr1) + nrow(chr2) + nrow(chr3) + nrow(chr4),
            nrow(chr1) + nrow(chr2) + nrow(chr3) + nrow(chr4) + 
              nrow(chr5),
            nrow(chr1) + nrow(chr2) + nrow(chr3) + nrow(chr4) + 
              nrow(chr5) + nrow(chr6),
            nrow(chr1) + nrow(chr2) + nrow(chr3) + nrow(chr4) + 
              nrow(chr5) + nrow(chr6) + nrow(chrX))



  
pdf('pFst-Clusters-3-2.pdf', width = 20, height = 4)
dat.p.32 <-
  ggplot(dat, aes(x=V4, y=-log10(V3))) +
  geom_point(size = 0.5, alpha = 0.4, aes(color = ChrCol)) +
  geom_point(data = top0.001, aes(x=V4, y=-log10(V3)),
             size = 0.75, alpha = 0.75, color = '#2b83ba') +
  geom_point(data = top0.0001, aes(x=V4, y=-log10(V3)),
             size = 1, color = '#d7191c') +
  geom_point(data = focal, aes(x=V4, y=-log10(V3)),
             size = 1, color = 'black') +
  scale_x_continuous(name="Chromosome", 
                     breaks=breaks, 
                     labels=c("1", "2", "3", "4", "5", "6", "X")) + 
  scale_color_grey(end = 0.6) +
  theme_pubr(15) +
  theme(legend.position = "none") +
  labs(x="SNP index", y="-log10(pFst)")
dat.p.32
dev.off()

top0.001 <- top0.001[,-c(4,5)]

GL.id <- str_split_fixed(top0.001$V1, '_', 3)[,2]
pos <- top0.001$V2
top.sites <- paste0(GL.id, '.1:', pos)

write.table(top0.001, 'Top-0.1Perc-pFst-3-2-Snps.txt', sep = ' ',
            quote = F, row.names = F, col.names = F)

write.table(top.sites, 'Top-0.1Perc-pFst-3-2-Positions.txt', sep = ' ',
            quote = F, row.names = F, col.names = F)


top0.0001 <- top0.0001[,-c(4,5)]

GL.id <- str_split_fixed(top0.0001$V1, '_', 3)[,2]
pos <- top0.0001$V2
top.sites <- paste0(GL.id, '.1:', pos)

write.table(top0.0001, 'Top-0.01Perc-pFst-3-2-Snps.txt', sep = ' ',
            quote = F, row.names = F, col.names = F)

write.table(top.sites, 'Top-0.01Perc-pFst-3-2-Positions.txt', sep = ' ',
            quote = F, row.names = F, col.names = F)

######################## Plot all together #########################
library(patchwork)

pdf('All-pFst-Manhattan-Plots.pdf', width = (20*0.75), height = (12*0.75))
(dat.p.12/dat.p.13/dat.p.32)
dev.off()

