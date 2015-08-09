## Start the programme by cleaning up the variables and setting up the right directory

getwd()
ls()
rm(list=ls())
setwd("F:/Rujuta/DataExploration")
# Data Download, unzip file
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile="./Assignment1/Data.zip")
unzip("./Assignment1/Data.zip")
# for doing the assignment in the most efficient way, i would be using the following r packages
# lubridate for date and time, readr for reading data, dplyr for data manipulation
library(dplyr)
library(readr)
HHData6 <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
library(lubridate)
HHData7 <- mutate(HHData6, datetime= paste(Date,Time,sep=" "))
HHData7$Date <- as.Date(HHData7$Date, format="%d/%m/%Y")
HHData8 <- filter(HHData7, (Date=="2007-02-02") | (Date=="2007-02-01"))
HHData8$Time <- strptime(HHData8$Time, format="%H:%M:%S")
HHData8$datetime <- strptime(HHData8$datetime, format="%d/%m/%Y %H:%M:%S")
HHData9 <- HHData8
HHData9$Global_active_power <- as.numeric(as.character(HHData9$Global_active_power))

# for Chart 4
par(mfrow=c(2,2), mar=c(5,4,2,1))
plot(HHData9$datetime,HHData9$Global_active_power,type="l", ylab="Global active power", xlab="")
HHData9$Voltage <- as.numeric(as.character(HHData9$Voltage))
plot(HHData9$datetime,HHData9$Voltage,type="l", ylab="Voltage", xlab="Datetime")
plot(x=HHData9$datetime, y=HHData9$Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering")
lines(x=HHData9$datetime, y=HHData9$Sub_metering_2, type="l", col="red")
lines(x=HHData9$datetime, y=HHData9$Sub_metering_3, type="l", col="blue")
legend(x="topright",legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"), border="white", col= c("black","red","blue"),lty=c(1,1,1),cex=0.5)

HHData9$Global_reactive_power <- as.numeric(as.character(HHData9$Global_reactive_power))
plot(HHData9$datetime,HHData9$Global_reactive_power,type="l", ylab="Global_reactive_power", xlab="Datetime")
