module load R
R

#in linux the following equal to source("https://raw.githubusercontent.com/caipine/Dataset_analysis/master/GSE3189/download_GSE3189.R") 

library(RCurl)
    eval( expr = 
        parse( text = getURL("https://raw.githubusercontent.com/caipine/Dataset_analysis/master/GSE3189/download_GSE3189.R",
                       ssl.verifypeer=FALSE) ))

library(RCurl)
    eval( expr = 
        parse( text = getURL("https://raw.githubusercontent.com/caipine/Dataset_analysis/master/GSE3189/call_GSE3189_cor.R",
                       ssl.verifypeer=FALSE) ))



call_GSE3189_cor(c("ESRRA", "ESRRG", "MITF","SNAI2","HMG20A","ZEB2"))
