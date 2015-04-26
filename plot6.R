## Baltimore, Maryland
Baltimore <- subset(NEI, fips == '24510' & type == 'ON-ROAD')
## Los Angeles County, California
LosAngeles <- subset(NEI, fips == '06037' & type == 'ON-ROAD')

# Aggregates Baltimore
Baltimore.DF <- aggregate(Baltimore[, 'Emissions'], by = list(Baltimore$year), sum)
colnames(Baltimore.DF) <- c('year', 'Emissions')
Baltimore.DF$City <- paste(rep('Baltimore City', 4))

# Aggregates Los Angeles
LosAngeles.DF <- aggregate(LosAngeles[, 'Emissions'], by = list(LosAngeles$year), sum)
colnames(LosAngeles.DF) <- c('year', 'Emissions')
LosAngeles.DF$City <- paste(rep('Los Angeles County', 4))

DF <- as.data.frame(rbind(Baltimore.DF, LosAngeles.DF))

## Saving to file
png('plot6.png')

## Generate the graph 
ggplot(data = DF, aes(x = year, y = Emissions)) + 
  guides(fill = FALSE) + 
  geom_bar(aes(fill = year), stat = "identity") + 
  ylab(expression('PM'[2.5])) + 
  xlab('Year') + 
  theme(legend.position = 'none') + 
  ggtitle('Total Emissions of Motor Vehicle Sources\n in Los Angeles County, California vs. Baltimore City') + 
  facet_grid(. ~ City) + 
  geom_text(aes(label = round(Emissions, 0), size = 1, hjust = 0.5, vjust = -1))
dev.off()