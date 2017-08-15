#Example3.R

library(stpm)

# Starting parameters:
model.par <- list(a=-0.05, f1=90, Q=1e-6, f=80, b=5, mu0=1e-5, theta=0.1)

# Data simulation:
data <- spm_projection(model.par, N=5000, ystart=80, model="discrete")

# Print some data:
head(data$data)

# Mean of covariates by age:
data$stat$mean.by.age

# Plot survival probabilities:
plot(data$stat$srv.prob, xlab="Years",ylab="Percent survival")
     