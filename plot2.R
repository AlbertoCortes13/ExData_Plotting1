##Read file
data <- read.csv("./household_power_consumption.txt", sep = ";")

##Show only information from "01-02-2007" and "02-02-2007"
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Convert Date
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalactivepower <- as.numeric(as.character(data$Global_active_power))
png("plot2.png", width = 480, height = 480)
plot(datetime, globalactivepower, type = "l", xlab = "", ylab = "Global Activity Power (kilowatts)")
dev.off()
