###CMD###    sudo apt-get install libcurl4-gnutls-dev 
####         install.packages("RCurl")

source("https://raw.githubusercontent.com/caipine/Dataset_analysis/master/GSE3189/test.R")

temp <- tempfile()
download.file("https://raw.githubusercontent.com/caipine/Dataset_analysis/master/GSE3189/test.R",temp, method="curl")


library(RCurl)

if(url.exists("https://raw.githubusercontent.com/caipine/Dataset_analysis/master/GSE3189/test.R")) {
test1 = getURL("https://raw.githubusercontent.com/caipine/Dataset_analysis/master/GSE3189/test.R")}
source(test1)


temp <- tempfile()
download.file("http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?mode=raw&is_datatable=true&acc=GPL96&id=15653&db=GeoDb_blob82",temp)
strs1 <- readLines(temp)



if(url.exists("https://raw.githubusercontent.com/caipine/Dataset_analysis/master/GSE3189/download_GSE3189.R")) {
txt = getURL("https://raw.githubusercontent.com/caipine/Dataset_analysis/master/GSE3189/download_GSE3189.R")}
source(txt)


qq{curl -sS "https://raw.githubusercontent.com/caipine/Dataset_analysis/master/GSE3189/download_GSE3189.R" }

?qq



call_GSE3189_cor(c("ESRRA", "ESRRG", "MITF","SNAI2","HMG20A","ZEB2"))

