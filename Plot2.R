# Exploratory Data Analysis
# Project 2

# Clean upworkspace
rm(list=ls())

library("plyr")

# Load data - please ensure the 2 files are in the working directory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data<-transform(NEI,year=factor(year))
data2<-data[data$fips=="24510",]

#Plot Data - for Total PM2.5 emission, log the sum so as to present a more friendly figure
plotdata2<-ddply(data2,.(year),summarize,sum=log(sum(Emissions)))
png("plot2.png")
plot(plotdata2$year,plotdata2$sum,type="n",xlab="Year",ylab="Total PM2.5 Emission (log)",
     main="PM2.5 emission in Baltimore City",boxwex=0.05)
lines(plotdata2$year,plotdata2$sum)
dev.off()