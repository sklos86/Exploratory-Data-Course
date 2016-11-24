myfile = "household_power_consumption.txt"
data = read.table(myfile, header = TRUE, na.strings = "?", sep = ";")
dates = data$Date
dates = strptime(dates, format = "%d/%m/%Y")
dates = as.Date(dates)
data = cbind(data,dates)
dataToUse = subset(data, data$dates == "2007-02-01" | data$dates == "2007-02-02")

datetime = paste(as.Date(dataToUse$dates), dataToUse$Time)
dataToUse$Datetime = as.POSIXct(datetime)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), bg = "light gray")
plot(dataToUse$Global_active_power ~ dataToUse$Datetime, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
plot(dataToUse$Voltage ~ dataToUse$Datetime, type = "l", 
     ylab = "Voltage", xlab = "datetime")
plot(dataToUse$Sub_metering_1 ~ dataToUse$Datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(dataToUse$Sub_metering_2 ~ dataToUse$Datetime, type = "l")
lines(dataToUse$Sub_metering_2 ~ dataToUse$Datetime, type = "l", col = "red")
lines(dataToUse$Sub_metering_3 ~ dataToUse$Datetime, type = "l", col = "blue")
legend("topright",  legend = paste(c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")), 
       lty = c(1,1,1),  col = c("black", "red", "blue"), bty = "n")
plot(dataToUse$Global_reactive_power ~ dataToUse$Datetime, type = "l", 
     ylab = "Global_reactive_power", xlab = "datetime")
dev.off()