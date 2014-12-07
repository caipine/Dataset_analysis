# from orignal ZIP file, only works in linux in my computer
list.files()
file_exist <- file.exists("exdata%2Fdata%2Fhousehold_power_consumption.zip")
if(!file_exist){
        dir <- paste("cd", getwd(), sep=" ")
        system(dir)
        system("wget https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip") 
}
w1<- read.csv(unz("exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.txt"), , sep = ";")
head(w1)

if(!file_exist) {
system("rm exdata%2Fdata%2Fhousehold_power_consumption.zip")
}
list.files()
