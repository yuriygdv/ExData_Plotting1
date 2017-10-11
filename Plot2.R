library(data.table)  #for efficient reading in data
library(pryr)        #memory
library(dplyr)       #data manipulation
library(lubridate)   #for time

#setwd("your work dir goes here")

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


# PLOTTING #2 

with(power_data, plot(DateTime, Global_active_power, type = "l", 
                      ylab = "Global Actve Power (kilowatts)",
                      xlab = ""))
dev.copy(png, file = "plot2.png")
dev.off()




