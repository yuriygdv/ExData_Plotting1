library(data.table)  #for efficient reading in data
library(pryr)        #memory
library(dplyr)       # data manipulation
library(lubridate)   #for time

#setwd("your work dir goes here")
#getwd()

if (!file.exists("household_power_consumption.zip")) {
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileURL, destfile = "household_power_consumption.zip")
    rm(fileURL)
}


if (!file.exists("household_power_consumption.txt")) {
    unzip("household_power_consumption.zip")
}

power_data <- fread("household_power_consumption.txt", na.strings="?")
power_data <- filter(power_data, Date == "1/2/2007" | Date == "2/2/2007")
power_data <- mutate(power_data, DateTime = dmy_hms(paste(Date, Time)))


# PLOTTING PLOT #4 

par(mfcol = c(2,2))

#1
with(power_data, plot(DateTime, Global_active_power, type = "l", 
                      ylab = "Global Actve Power (kilowatts)",
                      xlab = ""))

#2
with(power_data, plot(DateTime, Sub_metering_1, type = "n", ylab = "Energy Sub Metering", xlab = ""))
with(power_data, lines(DateTime, Sub_metering_1, col = "black"))
with(power_data, lines(DateTime, Sub_metering_2, col = "red"))
with(power_data, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#3
with(power_data, plot(DateTime, Voltage, type = "l"))

#4
with(power_data, plot(DateTime, Global_reactive_power, type = "l"))


dev.copy(png, file = "plot4.png")
dev.off()






