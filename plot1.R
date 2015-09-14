## This code assumes files are stored in WD

#loading libraries
library(dplyr)

#reading file
data <- read.csv("household_power_consumption.txt", sep=';')

#formating as date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#selecting rows
subset <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")
subset <- as.numeric(subset$Global_active_power)

hist(subset, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png")
dev.off()
