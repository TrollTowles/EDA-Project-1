#Load Dataset

dataLocation <- "./Data/household_power_consumption.txt"
data <- read.table(dataLocation, header = TRUE, sep = ";", 
                   stringsAsFactors = FALSE, dec = "." )

#Convert  to Date Variables

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Create Subset for appropriate dates

subSet <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Convert Global Reactive Power to numeric values

subSet$Global_active_power <- as.numeric(subSet$Global_active_power)

#Plot the histogram

hist(subSet$Global_active_power, main = "Global Active Power", xlab = 
       "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")