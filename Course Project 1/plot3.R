##Getting and preparing the data
data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
work_data = subset(data, data$Date %in% c("1/2/2007","2/2/2007"))
work_data$DateTime = strptime(paste(work_data$Date, work_data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

##Plotting
plot(work_data$DateTime, work_data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")l
ines(work_data$DateTime, work_data$Sub_metering_2, col="red")
ines(work_data$DateTime, work_data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
