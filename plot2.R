## This code assumes files are stored in WD

#reading file
File <- "./household_power_consumption.txt"
data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#selecting rows
subSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

dt <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(subSet$Global_active_power)

plot(dt, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()