rm(list=ls())

getwd()
setwd("F:/COURSERA/EDA/WEEK-1")

##reading the rawdata
data <- read.table(file = "household_power_consumption.txt",header = T,sep = ";",stringsAsFactors = FALSE)
head(data)


##subsetting the data as required
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
head(subSetData)
summary(subSetData)

##PLOT2 

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
head(datetime)
subsetdata <-cbind(subSetData,datetime)

globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower,  type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


