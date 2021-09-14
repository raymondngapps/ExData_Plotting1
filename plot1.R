# Read data from data file
raw <- read.csv("household_power_consumption.txt", sep = ";", na.strings = c("?"))

# Remove column not of the two date 
raw <- raw[which(raw$Date == "1/2/2007" | raw$Date == "2/2/2007"),]

# Plot graph
hist(raw$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.copy(png, "plot1.png")
dev.off()