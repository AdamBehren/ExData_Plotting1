data <- read.csv("C:/Users/adam.behrendorff/Desktop/tmp/Data/R/Exploratory/Electric power consumption/household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_sub <- subset(data, (data$Date == "2007-02-01")| (data$Date ==  "2007-02-02"))
data_sub$dateCombined <- as.POSIXct(paste(data_sub$Date, data_sub$Time), "%Y-%m-%d %H:%M:%S")

#plot 2 - 
png(filename="C:/Users/adam.behrendorff/Desktop/tmp/Data/R/Exploratory/plot2.png", width = 480, height = 480)
plot(x=data_sub$dateCombined, y = data_sub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)", main = "Plot 2")
dev.off()