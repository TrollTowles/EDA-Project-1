#Load Dataset

dataLocation <- "./Data/household_power_consumption.txt"
data <- read.table(dataLocation, header = TRUE, sep = ";", 
                   stringsAsFactors = FALSE, dec = "." )

#Convert  to Date Variables

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Create Subset for appropriate dates

subSet <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Create Datetime Vector

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Convert Values to Numerics

subSet$Global_active_power <- as.numeric(subSet$Global_active_power)
subSet$Voltage <- as.numeric(subSet$Voltage)
subSet$Global_reactive_power<- as.numeric(subSet$Global_reactive_power)

#Create Plots

par(mfrow = c(2,2))
plot(subSet$Global_active_power~subSet$datetime, type = "l", 
     xlab = "", ylab = "Global Active Power")
plot(subSet$Voltage~subSet$datetime, type = "l",
     xlab = "datetime", ylab = "Voltage")
plot(subSet$Sub_metering_1~subSet$datetime, type = "l", xlab = "", 
     ylab = "Energy sub metering")
lines(subSet$Sub_metering_2~subSet$datetime, type = "l", col = "red")
lines(subSet$Sub_metering_3~subSet$datetime, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(subSet$Global_reactive_power~subSet$datetime, type = "l", 
     ylab = "Global_reactive_power", xlab = "datetime")


