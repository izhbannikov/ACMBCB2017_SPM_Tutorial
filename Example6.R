#Example6.R

library(stpm)

#######################################################
############## One dimensional case ###################
#######################################################

# Data preparation #
data <- simdata_discr(N=1000, dt = 2)

miss.id <- sample(x=2:dim(data)[1], size=round(dim(data)[1]/4)) # ~25% missing data
incomplete.data <- data
incomplete.data[miss.id,5] <- NA
incomplete.data[miss.id-1,6] <- NA
# End of data preparation #

# Estimate parameters from the complete dataset #
p <- spm_discrete(data, theta_range = seq(0.075, 0.09, by=0.001))
p

##### Multiple imputation with SPM #####
imp.data <- spm.impute(dataset=incomplete.data, minp=5, theta_range=seq(0.075, 0.09, by=0.001))$imputed

# Estimate SPM parameters from imputed data and compare them to the p:
pp.test <- spm_discrete(imp.data, theta_range = seq(0.075, 0.09, by=0.001))
pp.test
