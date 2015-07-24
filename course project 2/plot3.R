library(plyr)
library(RColorBrewer)
library(ggplot2)


if(!exists("NEI"))NEI = readRDS("summarySCC_PM25.rds")
if(!exists("SCC"))SCC = readRDS("Source_Classification_Code.rds")

data = ddply(subset(NEI, fips == 24510),.(year, type), summarise, sum_pm = sum(Emissions))
cols = brewer.pal(9, "Reds")
png("plot3.png")
ggplot(data, aes(year,sum_pm, colour = type))+geom_line(size = 1)+geom_point(size = 4)+ggtitle("Total emissions from PM2.5 in the Baltimore County")+xlab("Year")+ylab("Emissions, tons")+scale_colour_manual(values = c(cols[3], cols[5], cols[7],cols[9]))+theme(plot.title = element_text(vjust=2))
dev.off()