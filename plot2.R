# Read data from data file
raw <- read.csv("household_power_consumption.txt", sep = ";", na.strings = c("?"))

# Remove column not of the two date 
raw <- raw[which(raw$Date == "1/2/2007" | raw$Date == "2/2/2007"),]

# Conver date time to correct format
raw$DateTime <- strptime(paste(raw$Date, raw$Time), format="%d/%m/%Y %H:%M:%S")

# Plot graph
plot(raw$DateTime, raw$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, "plot2.png")
dev.off()