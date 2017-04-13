rm(list=ls())

getwd()
setwd("F:/COURSERA/EDA/WEEK-1")

##reading the rawdata
data <- read.table(file = "household_power_consumption.txt",header = T,sep = ";",stringsAsFactors = FALSE)

##subsetting the data as required
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
head(subSetData)

##PLOT-4
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#graph1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#graph2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

#graph3
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#graph4
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
