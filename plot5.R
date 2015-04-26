library(ggplot2)

## Maryland
Maryland <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

## Aggregate
Maryland.df <- aggregate(Maryland[, 'Emissions'], by=list(Maryland$year), sum)
colnames(Maryland.df) <- c('year', 'Emissions')

## Saving to file
png("plot5.png")

## Generate the graph 
ggplot(data=Maryland.df,aes(x = year, y = Emissions)) +
  guides(fill=FALSE) +
  geom_bar(stat="identity",width=0.75) + 
  theme(legend.position='none') + 
  xlab('Year') +
  ylab(expression('PM'[2.5])) + 
  theme(legend.position = 'none') + 
  ggtitle('PM [2.5] Motor Vehicle Emissions 1999-2008')

dev.off()
