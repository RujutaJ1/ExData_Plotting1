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

HHData7 <- mutate(HHData6, datetime= paste(Date,Time,sep=" "))
HHData7$Date <- as.Date(HHData7$Date, format="%d/%m/%Y")
HHData8 <- filter(HHData7, (Date=="2007-02-02") | (Date=="2007-02-01"))
HHData8$Time <- strptime(HHData8$Time, format="%H:%M:%S")
HHData8$datetime <- strptime(HHData8$datetime, format="%d/%m/%Y %H:%M:%S")
HHData9 <- HHData8
HHData9$Global_active_power <- as.numeric(as.character(HHData9$Global_active_power))
# for Chart 1
hist(HHData9$Global_active_power, col="red", main="Global Active Power", xlab="Global active power(in Kilowatts)")