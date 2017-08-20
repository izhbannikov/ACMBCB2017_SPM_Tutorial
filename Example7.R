#Example7.R

library(stpm)

#########################################################
################ Two-dimensional case ###################
#########################################################

# Parameters for data simulation #
a <- matrix(c(-0.05, 0.01, 0.01, -0.05), nrow=2)
f1 <- matrix(c(90, 30), nrow=1, byrow=FALSE)
Q <- matrix(c(1e-7, 1e-8, 1e-8, 1e-7), nrow=2)
f0 <- matrix(c(80, 25), nrow=1, byrow=FALSE)
b <- matrix(c(5, 3), nrow=2, byrow=TRUE)
mu0 <- 1e-04
theta <- 0.07
ystart <- matrix(c(80, 25), nrow=2, byrow=TRUE)

# Data preparation #
data <- simdata_discr(N=1000, a=a, f1=f1, Q=Q, f=f0, b=b, ystart=ystart, mu0 = mu0, theta=theta, dt=2)

# Delete some observations in order to have approx. 25% missing data
incomplete.data <- data
miss.id <- sample(x=2:dim(data)[1], size=round(dim(data)[1]/4)) 
incomplete.data <- data
incomplete.data[miss.id,5] <- NA
incomplete.data[miss.id-1,6] <- NA
incomplete.data[miss.id,7] <- NA
incomplete.data[miss.id-1,8] <- NA

# End of data preparation #

# Estimate parameters from the complete data:
p <- spm_discrete(data, theta_range = seq(0.06, 0.08, by=0.001))
p

##### Multiple imputation with SPM #####
imp.data <- spm.impute(dataset=incomplete.data, minp=5, theta_range=seq(0.060, 0.08, by=0.001))$imputed

# Estimate SPM parameters from imputed data and compare them to the p:
pp.test <- spm_discrete(imp.data, theta_range = seq(0.060, 0.08, by=0.001))
pp.test