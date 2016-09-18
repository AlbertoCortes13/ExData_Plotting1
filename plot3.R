##Read file
data <- read.csv("./household_power_consumption.txt", sep = ";")

##Show only information from "01-02-2007" and "02-02-2007"
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Convert Date
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

sub1 <- as.numeric(as.character(data$Sub_metering_1))
sub2 <- as.numeric(as.character(data$Sub_metering_2))
sub3 <- as.numeric(as.character(data$Sub_metering_3))

png("plot3.png", width = 480, height = 480)


plot(datetime, sub1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, sub2, type = "l", col = "red")
lines(datetime, sub3, type = "l", col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2.5)

dev.off()