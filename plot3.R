if(!exists("NEI")){
        NEI <- readRDS("./summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("./Source_Classification_Code.rds")
}

library(ggplot2)

Baltimore <-  NEI[NEI$fips=="24510", ]

EmissionsperYearperType <- aggregate(Emissions ~ year + type, Baltimore, sum)

png("plot3.png", width=640, height=480)
g <- ggplot(EmissionsperYearperType, aes(year, Emissions, color = type))
g <- g + geom_line() +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions by different Source in Baltimore from 1999 to 2008')
print(g)
dev.off()