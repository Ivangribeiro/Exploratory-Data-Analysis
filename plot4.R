## This code assumes files are stored in WD

#reading file
File <- "./household_power_consumption.txt"
data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#selecting rows
subSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

dt <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(subSet$Global_active_power)
GRP <- as.numeric(subSet$Global_reactive_power)
subMetering1 <- as.numeric(subSet$Sub_metering_1)
subMetering2 <- as.numeric(subSet$Sub_metering_2)
subMetering3 <- as.numeric(subSet$Sub_metering_3)
volt <- as.numeric(subSet$Voltage)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0)) 

plot(dt, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(dt, volt, type="l", xlab="datetime", ylab="Voltage")

plot(dt, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, subMetering2, type="l", col="red")
lines(dt, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dt, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()