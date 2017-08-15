#Example4.R

library(stpm)

# Simulation
ff <- list(at="-0.001*t+.05", f1t="60", Qt="2e-8", ft="80", bt="5", mu0t="1e-3")
dat <- simdata_time_dep(N=1000, f=ff)

# Estimation
fff <- list(at="aa*t+bb", f1t="f1", Qt="Q", ft="f", bt="b", mu0t="mu0")
st <- list(a=-0.001, bb=0.05, f1=80, Q=2e-8, f=80, b=5, mu0=1e-3)
ans <- spm_time_dep(dat,start=st,f=fff,verbose = T)

# Another way to estimate parameters:
ans2 <- spm(list(data=dat),start=st,f=fff,verbose = T, model="time-dependent")
ans2
