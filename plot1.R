data <- read.csv("C:/Users/adam.behrendorff/Desktop/tmp/Data/R/Exploratory/Electric power consumption/household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_sub <- subset(data, (data$Date == "2007-02-01")| (data$Date ==  "2007-02-02"))


#plot 1 - histogram global active power vs frequency
data_sub$Global_active_power <- as.numeric(data_sub$Global_active_power)
data_sub$Global_active_power <- data_sub$Global_active_power/1000
breakas = c(0.25*0:20)
png(filename="C:/Users/adam.behrendorff/Desktop/tmp/Data/R/Exploratory/plot1.png", width = 480, height = 480)
hist(data_sub$Global_active_power, density = 200, col = 'red', breaks = breakas, border = 'black', main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", ylab = "Frequency")
dev.off()