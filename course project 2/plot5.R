library(plyr)
library(RColorBrewer)
library(ggplot2)

if(!exists("NEI"))NEI = readRDS("summarySCC_PM25.rds")
if(!exists("SCC"))SCC = readRDS("Source_Classification_Code.rds")

cols = brewer.pal(9, "Reds")
SCC_ind = SCC[SCC$Data.Category == "Onroad",1]
NEI_motor = subset(NEI, NEI$SCC %in% SCC_ind & fips == "24510")
data = ddply(NEI_motor,.(year), summarise, sum_pm = sum(Emissions))
png("plot5.png")
ggplot(data, aes(year,sum_pm, color = sum_pm))+geom_line(size = 1)+geom_point(size = 4)+ggtitle("Total emissions from motor vehicle sources in the Baltimore City")+xlab("Year")+ylab("Emissions, tons")+theme(plot.title = element_text(vjust=2))+scale_colour_gradient(low = cols[2], high = cols[7])
dev.off()