library(ggplot2)

## Saving to file
png(filename='plot3.png')

## Generate the graph 
ggplot(data=NEIBaltimore,aes(factor(year),Emissions,fill=type)) + facet_grid(. ~ type) + guides(fill=FALSE)+
  geom_bar(stat="identity") +
  ylab(expression(paste('PM'[2.5], ' Emissions'))) + 
  xlab('Year') +
  ggtitle(expression("Emissions in Baltimore City 1999-2008"))

dev.off()