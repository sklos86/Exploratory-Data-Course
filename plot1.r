myfile = "household_power_consumption.txt"
data = read.table(myfile, header = TRUE, na.strings = "?", sep = ";")
dates = data$Date
dates = strptime(dates, format = "%d/%m/%Y")
dates = as.Date(dates)
data = cbind(data,dates)
dataToUse = subset(data, data$dates == "2007-02-01" | data$dates == "2007-02-02")

png("plot1.png", width = 480, height = 480)
par(bg = "light gray")
hist(dataToUse$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red", ylim = c(0,1200))
dev.off()