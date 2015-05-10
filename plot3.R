#this is for the First assignment of Data Exploration topic"

#step1 : clear the workspace, set the directory to the working directory
getwd()
rm(list=ls())
ls()
setwd("F:/Rujuta/DataExploration/Assignment1")
# step2 : download data zip file, unzip it, note the system time when the download happened. 
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile="./data.zip" )
unzip("./data.zip")
downloadtime <- Sys.time()
#while i tried to read specific lines using readlines, i was not completely sure that my calculation 
#would be completely accurate on which lines to jump to.  so i am reading entire data. 
totaldata <- read.table("./household_power_consumption.txt", header=TRUE,sep=";")
#step4 : after reading data, check out the properties of the data
dim(totaldata)
str(totaldata)

library("data.table", lib.loc="~/R/win-library/3.1")
# processing the data in order to use it in graphs
totaldata2 <- data.table(totaldata)
totaldata3 <- totaldata2[, datetime3 := as.POSIXct(paste(totaldata2$Date, totaldata2$Time),format="%d/%m/%Y %H:%M:%S")]
totaldata4 <- totaldata3[, newdate:= as.Date(totaldata3$Date,format="%d/%m/%Y")]
totaldata5 <- subset(totaldata4,subset=((totaldata4$newdate=="2007-01-02")|(totaldata4$newdate=="2007-02-02")))

totaldata6 <- totaldata5[ ,GAP := as.character(totaldata5$Global_active_power)]
totaldata6$GAP <- as.numeric(totaldata6$GAP)


#for chart 3
totaldata7 <- totaldata6

totaldata7$Sub_metering_2 <- as.numeric(as.character(totaldata7$Sub_metering_2))
plot(totaldata7$datetime3,totaldata7$Sub_metering_1,type="l",xlab="" , ylab="Energy Sub Metering")
lines(totaldata7$datetime3,totaldata7$Sub_metering_2,col="red")
lines(totaldata7$datetime3,totaldata7$Sub_metering_3, col="blue")
legend("topright","Sub_metering_1",col="black")
