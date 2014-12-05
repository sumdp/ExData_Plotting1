#Script to create Plot 2
#set working directory
setwd("~/Documents/Personal/Coursera/DataScience_Specialization/Exploratory Data Analysis")
#load dataset
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
str(household_power_consumption)
#convert character to dates (using this to subset quickly)
household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")
#subset the data to the dates specified in the Project Brief
Feb_household_power_consumption <- subset(household_power_consumption, Date >= "2007-02-01" & Date < "2007-02-03")
#merge date & time columns into new column labelled Date.Time
Feb_household_power_consumption$Date.Time <- paste(Feb_household_power_consumption$Date, Feb_household_power_consumption$Time, sep=" ")
#convert Date.Time to POSIXlt
Feb_household_power_consumption$Date.Time <- strptime(Feb_household_power_consumption$Date.Time, "%Y-%m-%d %T")
#get rid of Date & Time columns
Feb_household_power_consumption$Date <- NULL
Feb_household_power_consumption$Time <- NULL

#plotting Plot 2
png("plot2.png", width = 480, height = 480, bg ="transparent")
plot(Feb_household_power_consumption$Date.Time, Feb_household_power_consumption$Global_active_power, type = "n", xlab = "", ylab = "")
lines(Feb_household_power_consumption$Date.Time, Feb_household_power_consumption$Global_active_power, col = "black")
title(xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()