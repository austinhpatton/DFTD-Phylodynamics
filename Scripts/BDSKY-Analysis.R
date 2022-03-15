BSlibrary(bdskytools)

setwd('~/Dropbox/Research/Devils/WG-Phylodynamics/Analyses-FINAL/BDSKY/Cluster2/')
fname <- "Cluster2-BDSKY-Combined.log"

#lf <- readLogfile(fname)
lf <- readLogfile(fname, burnin = 0.2)

R0_sky <- getSkylineSubset(lf, "reproductiveNumber")
delta_sky <- getSkylineSubset(lf, "becomeUninfectiousRate")

R0_hpd <- getMatrixHPD(R0_sky, alpha = 0.05)

timegrid       <- seq(from = 1, to = 29, by = 1)
R0_gridded     <- gridSkyline(R0_sky, lf$origin_BDSKY_Serial, timegrid)
delta_gridded  <- gridSkyline(delta_sky, lf$origin_BDSKY_Serial, timegrid)
delta_gridded_downsamp <- 

R0_gridded_hpd    <- getMatrixHPD(R0_gridded, alpha = 0.05)
delta_gridded_hpd <- getMatrixHPD(delta_gridded, alpha = 0.05)

timegrid <- rev(seq(from = 1990, to = 2018, by = 1))
bdsky.res <- as.data.frame(R0_gridded_hpd)
rownames(bdsky.res) <-c('Lower', 'Median', 'Upper')
bdsky.res <- as.data.frame(t(bdsky.res))
bdsky.res$Year <- timegrid
length(timegrid)

png("./SampWindow-BD-Skyline-Cluster2.png", width = 7, height = 5, units = 'in', res = 600)
ggplot(data = bdsky.res, aes(x = Year), 
       ylim(c(0, max(res$Upper)))) + 
  geom_hline(yintercept = 1, lty = 2, alpha = 0.5) +
  geom_ribbon(aes(ymin = Lower, 
                  ymax = Upper), 
              fill = pal.dark(corange),
              alpha = 0.25) +
  geom_line(aes(y = Median), size = 1.1) +
  geom_line(aes(y = Upper), lty = 3, size = 0.6) +
  geom_line(aes(y = Lower), lty = 3, size = 0.6) +
  ylab('Effective Reproduction Number (Re)') +
  theme_bw()
dev.off()
pdf("./SampWindow-BD-Skyline-Cluster2.pdf", width = 7, height = 5)
ggplot(data = bdsky.res, aes(x = Year), 
       ylim(c(0, max(res$Upper)))) + 
  geom_hline(yintercept = 1, lty = 2, alpha = 0.5) +
  geom_ribbon(aes(ymin = Lower, 
                  ymax = Upper), 
              fill = pal.dark(corange),
              alpha = 0.25) +
  geom_line(aes(y = Median), size = 1.1) +
  geom_line(aes(y = Upper), lty = 3, size = 0.6) +
  geom_line(aes(y = Lower), lty = 3, size = 0.6) +
  ylab('Effective Reproduction Number (Re)') +
  theme_bw()
dev.off()



plotSkylinePretty(timegrid, R0_gridded_hpd, 
                  ylims=c(0,8), col=pal.dark(corange), 
                  fill=pal.dark(corange,0.25), 
                  col.axis=pal.dark(corange), 
                  xlab="Time", ylab="Re", yline=2, 
                  xline=2, xgrid=TRUE, ygrid=TRUE)
abline(h = 1, lty = 2)



# plotSkylinePretty(timegrid, delta_gridded_hpd, 
#                   axispadding=0.0, ylims=c(0,0.5), 
#                   col=pal.dark(cpurple), 
#                   fill=pal.dark(cpurple,0.25), 
#                   col.axis=pal.dark(cpurple), 
#                   xaxis=FALSE, ylab="Delta", 
#                   side=4, yline=2, add=TRUE)
plotSkyline(timegrid, R0_gridded_rev, type='steplines')

plotSkyline(timegrid, R0_gridded_hpd, type='smooth')
plotSkyline(timegrid, R0_gridded_hpd2, type='smooth', add=TRUE)
plotSkyline(timegrid, R0_gridded_hpd, type='step')
plotSkyline(0:34, R0_hpd, type='step')

x <- c(seq(0,10,2), seq(20, 40, 3), 40:66)
plotSkyline(c(seq(0,10,2), seq(20, 40, 3), 40:66), R0_hpd, type='step')
for (y in x) abline(v = y)

plotSkyline(timegrid, R0_gridded_hpd, type='smooth', col=pal.dark(cblue), fill=pal.dark(cblue,0.25))
plotSkyline(timegrid, R0_gridded, type='steplines', col=pal.dark(cgreen,0.1), traces=100, add=TRUE, new=FALSE)

plotSkyline(1:34, bdskytools:::revMatrix(R0_sky[1:3,]), type='steplines', col=pal.dark(cgreen,1), traces=3)
plotSkyline(timegrid, R0_gridded[1:3,], type='steplines', col=pal.dark(cblue,1), traces=3, add=TRUE, new=TRUE)



plotSkylinePretty(timegrid, R0_gridded_hpd, axispadding=0.0, ylims=c(0,2), col=cblue, col.axis=pal.dark(cblue), xlab="time", ylab="R0", yline=2, xline=2)
