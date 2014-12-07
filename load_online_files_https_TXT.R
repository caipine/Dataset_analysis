#from upload txt file in github https, only work with RCurl package
library(RCurl)
URL <- "https://raw.githubusercontent.com/caipine/ExData_Plotting1/master/data/household_power_consumption.txt"
x11 <- getURL(URL) 
## Or 
## x <- getURL(URL, ssl.verifypeer = FALSE)
w1 <- read.csv(textConnection(x11), sep = ";")



