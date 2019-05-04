if(!exists("NEI")){
        NEI <- readRDS("./summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("./Source_Classification_Code.rds")
}

library(ggplot2)

if(!exists("mergedNEISCC")){
        mergedNEISCC <- merge(NEI, SCC, by="SCC")}
        
coal  <- grepl("coal", mergedNEISCC$Short.Name, ignore.case=TRUE)
CoalEmissions <- mergedNEISCC[coal, ]

CoalEmissionsperYear <- aggregate(Emissions ~ year, CoalEmissions, sum)

png("plot4.png", width=640, height=480)
g <- ggplot(CoalEmissionsperYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()