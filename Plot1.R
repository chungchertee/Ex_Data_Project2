# Exploratory Data Analysis
# Project 2


library("plyr")

# Load data - please ensure the 2 files are in the working directory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data<-transform(NEI,year=factor(year))

#Plot Data - for Total PM2.5 emission, log the sum so as to present a more friendly figure
plotdata<-ddply(data,.(year),summarize,sum=log(sum(Emissions)))
png("plot1.png")
plot(plotdata$year,plotdata$sum,type="n",xlab="Year",ylab="Total PM2.5 Emission (log)",boxwex=0.05)
lines(plotdata$year,plotdata$sum)
dev.off()