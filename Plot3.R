data <- read.csv("C:/Users/adam.behrendorff/Desktop/tmp/Data/R/Exploratory/Electric power consumption/household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_sub <- subset(data, (data$Date == "2007-02-01")| (data$Date ==  "2007-02-02"))
data_sub$dateCombined <- as.POSIXct(paste(data_sub$Date, data_sub$Time), "%Y-%m-%d %H:%M:%S")

#plot 3 - 
png(filename="C:/Users/adam.behrendorff/Desktop/tmp/Data/R/Exploratory/plot3.png", width = 480, height = 480)
plot(x=data_sub$dateCombined, y = data_sub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering", main = "Plot 3")
lines(x=data_sub$dateCombined, y = data_sub$Sub_metering_2, type = "l", col = 'red')
lines(x=data_sub$dateCombined, y = data_sub$Sub_metering_3, type = "l", col = 'blue')
legend("topright", c("submetering_1", "submetering_2", "submetering_3"), lwd = 1, col = c("black", 'red', 'blue'))
dev.off()