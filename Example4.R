#Example4.R
# Data simulation

library(stpm)

# Starting parameters:
model.par <- list(a=-0.05, f1=90, Q=1e-6, f=80, b=5, mu0=1e-5, theta=0.1)
# simulation:
data <- spm_projection(model.par, N=5000, ystart=80, model="discrete")
# Mean of covariates by age:
data$stat$mean.by.age
# Plot survival probabilities:
plot(data$stat$srv.prob, xlab="Years",ylab="Percent survival")

# Simulation
ff <- list(at="-0.001*t+.05", f1t="60", Qt="2e-8", ft="80", bt="5", mu0t="1e-3")
dat <- simdata_time_dep(N=500, f=ff)
