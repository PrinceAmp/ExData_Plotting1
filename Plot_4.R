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

#plot #4

#set up plot areas 2x2 (2 rows, 2 columns)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

#row 1 column 1
with(dataFile, plot(Global_active_power~dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

#row 1 column 2
with(dataFile, plot(Voltage~dateTime, type="l", ylab="Voltage (volt)", xlab=""))

#row 2 column 1
with(t, {
  plot(Sub_metering_1~dateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
})

#row 2 column 2
with(dataFile, plot(Global_reactive_power~dateTime, type="l", ylab="Global Rective Power (kilowatts)",xlab=""))

