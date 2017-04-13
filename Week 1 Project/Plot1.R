rm(list=ls())

getwd()
setwd("F:/COURSERA/EDA/WEEK-1")

##reading the rawdata
data <- read.table(file = "household_power_consumption.txt",header = T,sep = ";",stringsAsFactors = FALSE)

##subsetting the data as required
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
summary(subSetData)

##PLOT-1

subSetData$Global_active_power <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)

hist(subSetData$Global_active_power, axes= FALSE,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
axis(2)
axis(1,at=seq(0,10,by=2),labels=seq(0,10,by=2))
dev.off()


