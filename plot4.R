library(ggplot2)

coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE)
comb <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalcomb<- (comb & coal)
combustionValue <- SCC[coalcomb,]$SCC
combustionTotal <- NEI[NEI$SCC %in% combustionValue,]

## Saving to file
png("plot4.png")

## Generate the graph 
ggplot(combustionTotal,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity") +
  theme_bw() +  guides(fill=FALSE) +
  xlab('Year') +
  ylab(expression('PM'[2.5])) + 
  ggtitle(expression("PM"[2.5]*" Coal Combustion Emissions 1999-2008"))

dev.off()


