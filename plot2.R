fullData <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") 

data1 <- subset(fullData, Date %in% c("1/2/2007","2/2/2007"))

data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")

data1$Datetime <- strptime(paste(data1$Date, data1$Time), "%Y-%m-%d %H:%M:%S")
data1$Datetime <- as.POSIXct(data1$Datetime) 

png("plot2.png", width=480, height=480)
with(data1, plot(Datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off() 
