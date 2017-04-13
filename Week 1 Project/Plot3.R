rm(list=ls())

getwd()
setwd("F:/COURSERA/EDA/WEEK-1")

##reading the rawdata
data <- read.table(file = "household_power_consumption.txt",header = T,sep = ";",stringsAsFactors = FALSE)

##subsetting the data as required
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
head(subSetData)

##PLOT-3

subSetData$Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
subSetData$Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
subSetData$Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)

datetime <-strptime(paste(subSetData$Date ,subSetData$Time,sep = " "), "%d/%m/%Y %H:%M:%S")

png("plot3.png",width = 480,height = 480)
plot(datetime, subSetData$Sub_metering_1, type="l",xlab= " ", ylab = "Energy Sub metering")
points(datetime, subSetData$Sub_metering_2, type="l",col="red")
points(datetime, subSetData$Sub_metering_3, type="l",col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,col=c("black", "red", "blue"))

dev.off()
