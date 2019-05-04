if(!exists("NEI")){
        NEI <- readRDS("./summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("./Source_Classification_Code.rds")
}

Baltimore <-  NEI[NEI$fips=="24510", ]

EmissionsperYear <- aggregate(Emissions ~ year, Baltimore, sum)

png('plot2.png')
barplot(height=EmissionsperYear$Emissions, names.arg=EmissionsperYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years in Baltimore'))
dev.off()