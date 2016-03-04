#Load Dataset

dataLocation <- "./Data/household_power_consumption.txt"
data <- read.table(dataLocation, header = TRUE, sep = ";", 
                   stringsAsFactors = FALSE, dec = "." )

#Convert  to Date Variables

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Create Subset for appropriate dates

subSet <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Convert Dates

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Convert Global Active Power to Numeric

subSet$Global_active_power <- as.numeric(subSet$Global_active_power)

#Create Plot

plot(subSet$Global_active_power~subSet$datetime, type="l", xlab = "",
     ylab="Global Active Power (kilowatts)")