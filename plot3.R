## step 1: Load data into R
fullData <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") 

## step 2: Subset the data 
data1 <- subset(fullData, Date %in% c("1/2/2007","2/2/2007"))

## step 3: convert the date variable to Date class 
data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")

## step 4: convert dates and times to the POSIXct class
data1$Datetime <- strptime(paste(data1$Date, data1$Time), "%Y-%m-%d %H:%M:%S")
#option: Datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(data1$Datetime) # or option: as.POSIXct(Datetime)

## step 5: Creat plot 3
png("plot3.png", width=480, height=480) # Open PNG device; create 'plot3.png' in my working diretory
# Create a plot, annotate plot and send to the file
with(data1, {
  plot(Datetime, Sub_metering_1, type="l",
       ylab="Enery sub metering", xlab="")
  lines(Datetime, Sub_metering_2, type = "l", col='Red')
  lines(Datetime, Sub_metering_3, type = "l", col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off() # Close the PNG file device