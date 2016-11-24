myfile = "household_power_consumption.txt"
data = read.table(myfile, header = TRUE, na.strings = "?", sep = ";")
dates = data$Date
dates = strptime(dates, format = "%d/%m/%Y")
dates = as.Date(dates)
data = cbind(data,dates)
dataToUse = subset(data, data$dates == "2007-02-01" | data$dates == "2007-02-02")

datetime = paste(as.Date(dataToUse$dates), dataToUse$Time)
dataToUse$Datetime = as.POSIXct(datetime)

png("plot2.png", width = 480, height = 480)
par(bg = "light gray")
plot(dataToUse$Global_active_power ~ dataToUse$Datetime, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()