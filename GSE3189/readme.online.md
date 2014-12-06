###CMD###    sudo apt-get install libcurl4-gnutls-dev 
####         install.packages("RCurl")

library(RCurl)

if(url.exists("https://raw.githubusercontent.com/caipine/Dataset_analysis/master/GSE3189/test.R")) {
test1 = getURL("https://raw.githubusercontent.com/caipine/Dataset_analysis/master/GSE3189/test.R")}
source(test1)





if(url.exists("https://raw.githubusercontent.com/caipine/Dataset_analysis/master/GSE3189/download_GSE3189.R")) {
txt = getURL("https://raw.githubusercontent.com/caipine/Dataset_analysis/master/GSE3189/download_GSE3189.R")}
source(txt)





call_GSE3189_cor(c("ESRRA", "ESRRG", "MITF","SNAI2","HMG20A","ZEB2"))

