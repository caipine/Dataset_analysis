setwd("Q:/github/Dataset_analysis/GSE3189")  # change to your path which include your R script files 

getwd()  # make sure path is right
list.files() #make sure  it have "download.R"  and "call_GSE3189_cor.R"  files 
source("download_GSE3189.R") # it will take a few minutes to download geneID file and matrix_data
source("call_GSE3189_cor.R")  # 

call_GSE3189_cor(c("ESRRA", "ESRRG", "MITF","SNAI2","HMG20A","ZEB2"))

