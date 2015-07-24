library(plyr)
library(RColorBrewer)
library(ggplot2)

if(!exists("NEI"))NEI = readRDS("summarySCC_PM25.rds")
if(!exists("SCC"))SCC = readRDS("Source_Classification_Code.rds")

SCC_ind = SCC[SCC$Data.Category == "Onroad",1]
NEI_motor = subset(NEI, NEI$SCC %in% SCC_ind & (fips == "24510"|fips == "06037"))
data = ddply(NEI_motor,.(year, fips), summarise, sum_pm = sum(Emissions))
data[data$fips=="24510",2] = "Baltimore City"
data[data$fips=="06037",2] = "Los Angeles County"
cols = brewer.pal(9, "Reds")
png("plot6.png")
ggplot(data, aes(year,sum_pm, colour = fips))+geom_line(size= 1)+geom_point(size = 4)+ggtitle("Total emissions from motor vehicle sources in the Baltimore City and Los Angeles County")+xlab("Year")+ylab("Emissions, tons")+scale_colour_manual(values = c(cols[3], cols[9]))+theme(plot.title = element_text(vjust=2, size = 8))
dev.off()