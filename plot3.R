#Load Dataset

data <- read.table(dataLocation, header = TRUE, sep = ";", 
                   stringsAsFactors = FALSE, dec = "." )

#Convert  to Date Variables

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Create Subset for appropriate dates

subSet <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Convert Dates

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Plot Lines

plot(subSet$Sub_metering_1~subSet$datetime, type = "l", xlab = "", 
     ylab = "Energy sub metering")
lines(subSet$Sub_metering_2~subSet$datetime, type = "l", col = "red")
lines(subSet$Sub_metering_3~subSet$datetime, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))
