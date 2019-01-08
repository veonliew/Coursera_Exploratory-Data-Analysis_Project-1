fullData <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") 
 
data1 <- subset(fullData, Date %in% c("1/2/2007","2/2/2007"))

data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")

data1$Datetime <- strptime(paste(data1$Date, data1$Time), "%Y-%m-%d %H:%M:%S")
data1$Datetime <- as.POSIXct(data1$Datetime) 

png("plot3.png", width=480, height=480) 
with(data1, {
  plot(Datetime, Sub_metering_1, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Datetime, Sub_metering_2, type = "l", col='Red')
  lines(Datetime, Sub_metering_3, type = "l", col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off() 
