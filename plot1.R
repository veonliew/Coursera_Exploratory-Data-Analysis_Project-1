## step 1: download zip file from website
if(!file.exists("./data")) dir.create("./data")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = './data/exdata_data_household_power_consumption.zip')

## step 2: unzip dataset
if(!file.exists("./data/household_power_consumption.txt"))
unzip('./data/exdata_data_household_power_consumption.zip', exdir = './data')

## step 3: Load data into R
fullData <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") 

## step 4: Subset the data 
data1 <- subset(fullData, Date %in% c("1/2/2007","2/2/2007"))

## step 5: convert the date variable to Date class 
data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")

## step 6: Creat plot 1
png("plot1.png", width=480, height=480) # Open PNG device; create 'plot1.png' in my working diretory
# Create a plot, annotate plot and send to the file
hist(data1$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="Red") 
dev.off() # Close the PNG file device