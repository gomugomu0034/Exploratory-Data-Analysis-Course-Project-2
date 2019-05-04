if(!exists("NEI")){
        NEI <- readRDS("./summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("./Source_Classification_Code.rds")
}

library(ggplot2)


BaltimoreMotorVehicles <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

EmissionsBaltimoreMotorVehicles <- aggregate(Emissions ~ year, BaltimoreMotorVehicles, sum)

png("plot5.png", width=840, height=480)
g <- ggplot(EmissionsBaltimoreMotorVehicles, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore from 1999 to 2008')
print(g)
dev.off()