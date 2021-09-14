# Read data from data file
raw <- read.csv("household_power_consumption.txt", sep = ";", na.strings = c("?"))

# Remove column not of the two date 
raw <- raw[which(raw$Date == "1/2/2007" | raw$Date == "2/2/2007"),]

# Conver date time to correct format
raw$DateTime <- strptime(paste(raw$Date, raw$Time), format="%d/%m/%Y %H:%M:%S")

# Plot graph
png("plot3.png", width = 480, height = 480, units = "px")
plot(raw$DateTime, raw$Sub_metering_1, col= "black", type = "l", xlab = "", ylab = "Energy sub metering", width = 480, height = 480)
lines(raw$DateTime, raw$Sub_metering_2, col = "red")
lines(raw$DateTime, raw$Sub_metering_3, col = "blue")
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1, 1, 1))
dev.off()