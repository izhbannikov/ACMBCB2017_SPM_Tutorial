#Example3.R
#Model with time-dependent parameters

library(stpm)

# Reading raw data
raw.data <- read.csv(system.file("extdata", "longdat.csv", package="stpm"))
head(raw.data)

#Prepare data for optimization
data <- prepare_data(x=system.file("extdata", "longdat.csv", package="stpm"), 
                     col.id = "ID", col.status = "IndicatorDeath", 
                     col.age = "Age", 
                     covariates = "DBP", 
                     impute=FALSE)

pars <- spm_time_dep(x=data[[1]], 
                     start = list(a = -0.05, f1 = 80, Q = 2e-08, f = 80, 
                                          b = 5, mu0 = 0.001),
                     frm = list(at = "a", f1t = "f1", Qt = "Q", 
                                ft = "f", bt = "b", mu0t = "mu0"))

