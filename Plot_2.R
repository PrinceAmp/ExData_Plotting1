# read in file
dataFile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
                       colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

# Format date to Type Date
dataFile$Date <- as.Date(dataFile$Date, "%d/%m/%Y")

# take out subset of data set at Feb. 1, 2007 and Feb. 2, 2007
dataFile <- subset(dataFile,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

#Combine Date and Time column
dateTime <- paste(dataFile$Date, dataFile$Time)

#set name to Datetime
dateTime <- setNames(dateTime, "DateTime")

#add dateTime to the dataset
dataFile <- cbind(dateTime, dataFile)

# Format dateTime Column
dataFile$dateTime <- as.POSIXct(dateTime)

# plot #2
plot(dataFile$Global_active_power~dataFile$dateTime,type="l", ylab="Global Active Power (kilowatts)", xlab="")