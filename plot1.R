#Script to create Plot 1
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

#plotting Plot 1
png("plot1.png", width = 480, height = 480, bg ="transparent") # size parametesrs specified, background colour is chosen as transparent for ease of use
hist(Feb_household_power_consumption$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()