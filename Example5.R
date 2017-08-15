#Example5.R
library(stpm) 

data(ex_spmcon1dg)
res <- spm_con_1d_g(ex_data$spm_data, ex_data$gene_data, 
                    a = -0.02, b=0.2, q=0.01, f=3, f1=3, 
                    mu0=0.01, theta=1e-05, 
                    upper=c(-0.01,3,0.1,10,10,0.1,1e-05), 
                    lower=c(-1,0.01,0.00001,1,1,0.001,1e-05), 
                    effect=c('q'))

res