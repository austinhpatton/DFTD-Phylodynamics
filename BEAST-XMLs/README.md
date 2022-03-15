## Supplementary XMLs
This directory holds a number of XMLs outlining multiple models used to conduct phylodynamic analysis of DFTD using BEAST. 
#### 1) Final-Clock-Genes-BDSKY-Run1.xml
- XML file used to run the full, Birth Death Skyline (BDSKY) model on the final, concatenated clock-like genes to estimate the effective reproduction number through time across the full tumor phylogeny. Four replicate runs using different random seeds were conducted to ensure we attained convergence at the conclusion of the MCMC. This approach was repeated for all analyses in BEAST. 
#### 2) Cluster2-BDSKY-Run1.xml
- The same model as fitted to the full tree, but not including only sampled from transmission cluster 2.
#### 3) Cluster3-BDSKY-Run1.xml
- The same model as fitted to the full tree, but not including only sampled from transmission cluster 3.
#### 4) Final-Clock-Genes-cbSKY-Run1.xml
- XML file used to run the full, Coalescent Bayesian Skyline (BDSKY) model on the final, concatenated clock-like genes to estimate the effective number of infections through time across the entire tumro phylogeny. 
#### 5) Final-Clock-Genes-SPREAD-BRW.xml
- XML for analysis of bayesian continuous phylogeography, visualized in SpreaD3. Dispersal rates were modeled either as a Brownian diffusion process (Brownian Random Walk - BRW - this XML), or as a relaxed, random walk, with branch-specific scaling factors being drawn either from a Cauchy, Gamma, or Lognormal distribution. Marginal likelihoods for each model were obtained using stepping stone and path sampling; these likelihoods were then used to assess relative model fit. 
#### 6) Final-Clock-Genes-SPREAD-Cauchy.xml
- Same model as above, but with random-walk branch scaling factors drawn from a Cauchy distribution. This model was the best fitting of the four analyzed. 
#### 7) Final-Clock-Genes-SPREAD-Gamma.xml
- Same model as above, but with random-walk branch scaling factors drawn from a Gamma distribution. 
#### 8) Final-Clock-Genes-SPREAD-Lognormal.xml
- Same model as above, but with random-walk branch scaling factors drawn from a Lognormal distribution. 
