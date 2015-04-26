#set location
getwd()

## Read file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

totalEmission <- aggregate(Emissions ~ year, NEI, sum)
totalEmission

## Saving to file
png(filename='plot1.png')

## Generate the graph
barplot(
  (totalEmission$Emissions/10^3),
  names.arg=totalEmission$year,
  xlab="Year",
  ylab="PM2.5 Emissions",
  main="Total PM2.5 Emissions in United States"
)

dev.off()
