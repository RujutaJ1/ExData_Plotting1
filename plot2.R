getwd()
setwd("F:/Rujuta/Dataexploration")
#read the complete file
full_data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
#changing the format of the date 
datefromdata <- as.Date(full_data$Date, format="%d/%m/%Y")

datefromdata -> full_data$Date

#combining the date and time
datetimedraft1 <- paste(full_data$Date, full_data$Time)

datetime <- as.POSIXct(datetimedraft1, format="%Y-%m-%d %H:%M:%S")

# subset of the data, for the 2 date
subsetdata1 <- subset(full_data, subset=((full_data$Date=="2007-02-01")|(full_data$Date=="2007-02-02")))
#changing the type of Global active power to numeric

Global_Active_Power <- as.numeric(subsetdata1$Global_active_power)
plot(Global_Active_Power~ subsetdata1$Time, type="l")
