##Getting and preparing the data
data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
work_data = subset(data, data$Date %in% c("1/2/2007","2/2/2007"))
work_data$DateTime = strptime(paste(work_data$Date, work_data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

##Plotting
par(mfrow = c(2,2), mar = c(4,4,2,1))
plot(work_data$DateTime, work_data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
plot(work_data$DateTime, work_data$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(work_data$DateTime, work_data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(work_data$DateTime, work_data$Sub_metering_2, col="red")
lines(work_data$DateTime, work_data$Sub_metering_3, col="blue")
plot(work_data$DateTime, work_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
