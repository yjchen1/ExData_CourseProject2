getwd()

## Subset data
NEIBaltimore<-subset(NEI, fips == "24510")

totalEmissionBaltimore <- aggregate(Emissions ~ year, NEIBaltimore, sum)
totalEmissionBaltimore

## Saving to file
png(filename='plot2.png')

## Generate the graph 
barplot(
  totalEmissionBaltimore$Emissions,
  names.arg=totalEmissionBaltimore$year,
  xlab="Year",
  ylab="PM2.5 Emissions",
  main="Total PM2.5 Emissions in Baltimore City"
)

dev.off()
