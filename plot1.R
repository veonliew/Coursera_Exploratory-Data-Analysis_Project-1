if(!file.exists("./data")) dir.create("./data")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = './data/exdata_data_household_power_consumption.zip')

if(!file.exists("./data/household_power_consumption.txt"))
unzip('./data/exdata_data_household_power_consumption.zip', exdir = './data')

fullData <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") 

data1 <- subset(fullData, Date %in% c("1/2/2007","2/2/2007"))

data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")

png("plot1.png", width=480, height=480) 
hist(data1$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="Red") 
dev.off() 
