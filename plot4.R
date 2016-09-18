##Read file
data <- read.csv("./household_power_consumption.txt", sep = ";")

##Show only information from "01-02-2007" and "02-02-2007"
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Convert Date
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

##Plot Global Active Power
globalactivepower <- as.numeric(as.character(data$Global_active_power))
plot(datetime, globalactivepower, type = "l", xlab = "", ylab = "Global Activity Power (kilowatts)")

##Plot Voltage
voltage <- as.numeric(as.character(data$Voltage))
plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

##Plot Energy sub metering
sub1 <- as.numeric(as.character(data$Sub_metering_1))
sub2 <- as.numeric(as.character(data$Sub_metering_2))
sub3 <- as.numeric(as.character(data$Sub_metering_3))

plot(datetime, sub1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, sub2, type = "l", col = "red")
lines(datetime, sub3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2.5)

##Plot Global reactive power
globalreactivepower <- as.numeric(as.character(data$Global_reactive_power))
plot(datetime, globalreactivepower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

