library(data.table)  #for efficient reading in data
library(pryr)        #memory
library(dplyr)       # data manipulation
library(lubridate)   #for time

setwd("E:/Coursera/DataScience - Johns Hopkins University/04_Exploratory Data Analysis/Project1/ExData_Plotting1")
getwd()

if (!file.exists("household_power_consumption.zip")) {
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileURL, destfile = "household_power_consumption.zip")
    rm(fileURL)
}

if (!file.exists("household_power_consumption.txt")) {
    unzip("household_power_consumption.zip")
}

power_data <- fread("household_power_consumption.txt", na.strings="?")
#head(power_data)
power_data <- filter(power_data, Date == "1/2/2007" | Date == "2/2/2007")
#head(power_data)
power_data <- mutate(power_data, DateTime = dmy_hms(paste(Date, Time)))



# PLOTTING #1
hist(power_data$Global_active_power, col = "red", 
                                     main = "Global Active Power", 
                                     xlab = "Global Actve Power (kilowatts)",
                                     ylab = "Frequency")

dev.copy(png, file = "plot1.png")
dev.off()






