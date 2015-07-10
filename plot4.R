data <- read.csv("C:/Users/adam.behrendorff/Desktop/tmp/Data/R/Exploratory/Electric power consumption/household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_sub <- subset(data, (data$Date == "2007-02-01")| (data$Date ==  "2007-02-02"))
data_sub$dateCombined <- as.POSIXct(paste(data_sub$Date, data_sub$Time), "%Y-%m-%d %H:%M:%S")
data_sub$Voltage <- as.numeric(as.character(data_sub$Voltage))

png(filename="C:/Users/adam.behrendorff/Desktop/tmp/Data/R/Exploratory/plot4.png", width = 480, height = 480)
#plot 4 - 
par(mfrow=c(2,2))
#subplot 1
plot(x=data_sub$dateCombined, y = data_sub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

#subplot 2
plot(x=data_sub$dateCombined, y = data_sub$Voltage, type = "l", xlab = "", ylab = "Voltage")

#subplot 3
plot(x=data_sub$dateCombined, y = data_sub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(x=data_sub$dateCombined, y = data_sub$Sub_metering_2, type = "l", col = 'red')
lines(x=data_sub$dateCombined, y = data_sub$Sub_metering_3, type = "l", col = 'blue')
legend("topright", c("submetering_1", "submetering_2", "submetering_3"), lwd = 1, col = c("black", 'red', 'blue'))

#subplot 4
plot(x=data_sub$dateCombined, y = data_sub$Global_reactive_power, type = "l", xlab = "", ylab = "Global_reactive_power")

dev.off()