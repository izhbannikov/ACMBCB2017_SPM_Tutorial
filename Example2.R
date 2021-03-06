#Example2.R
#Quick start

library(stpm)

# Let's take a look at raw data
raw.data <- read.csv(system.file("extdata", "longdat.csv", package="stpm"))
head(raw.data)

#Prepare data for optimization
data <- prepare_data(x=system.file("extdata", "longdat.csv", package="stpm"))
                                    
#Estimate parameters
#(default model: discrete-time):
p.discr.model <- spm(data)
p.discr.model
                                    
