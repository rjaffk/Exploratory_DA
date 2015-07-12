##Getting and preparing the data
data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
work_data = subset(data, data$Date %in% c("1/2/2007","2/2/2007"))
work_data$DateTime = strptime(paste(work_data$Date, work_data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

##Plotting
hist(work_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
