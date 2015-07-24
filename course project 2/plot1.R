if(!exists("NEI"))NEI = readRDS("summarySCC_PM25.rds")
if(!exists("SCC"))SCC = readRDS("Source_Classification_Code.rds")

data = ddply(NEI,.(year), summarise, sum_pm = sum(Emissions))

png("plot1.png")
plot(data, type = "l", main = "Total emissions from PM2.5 decreased in the United States", xlab = "Year", ylab = expression("Emissions, PM"[2.5]), lwd = 2, col = "red")
dev.off()
