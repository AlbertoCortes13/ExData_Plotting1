##Read file
data <- read.csv("./household_power_consumption.txt", sep = ";")

##Convert Date
data$Date <- strptime(data$Date, "%d/%m/%Y")

##Show only information from "2007-02-01" and "2007-02-02"
data <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

##Global Active Power Graph
globalactivepower <- as.numeric(data$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(globalactivepower, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
