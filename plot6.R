if(!exists("NEI")){
        NEI <- readRDS("./summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("./Source_Classification_Code.rds")
}

library(ggplot2)

motorBaltimoreLA <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

EmissionsmotorBaltimoreLA <- aggregate(Emissions ~ year + fips, motorBaltimoreLA, sum)
EmissionsmotorBaltimoreLA$fips[EmissionsmotorBaltimoreLA$fips=="24510"] <- "Baltimore"
EmissionsmotorBaltimoreLA$fips[EmissionsmotorBaltimoreLA$fips=="06037"] <- "Los Angeles"

png("plot6.png", width=1040, height=480)
g <- ggplot(EmissionsmotorBaltimoreLA, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions from motor vehicle in Baltimore vs Los Angeles from 1999 to 2008')
print(g)
dev.off()

