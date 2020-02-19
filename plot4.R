## read and subset data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, dec = ".", stringsAsFactors = FALSE)
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## convert Columns Date and Time
datetime <- strptime(paste(subdata$Date, subdata$Time, " "), "%d/%m/%Y %H:%M:%S")

## setting char grid

png("plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))

## plot global active power 
plot(datetime, as.numeric(subdata$Global_active_power), type ="l", xlab = "",
     ylab = "Global Active Power (killowatts)")

## plot datetime and enregy sub metering
plot(datetime, as.numeric(subdata$Sub_metering_1), type ="l",  xlab = "",
     ylab = "Energy sub metering")
lines(datetime, as.numeric(subdata$Sub_metering_2), type ="l", col = "red")
lines(datetime, as.numeric(subdata$Sub_metering_3), type ="l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty =1, bty = "n")

## plot datetime and voltage
plot(datetime, as.numeric(subdata$Voltage), type ="l", xlab = "datetime",
     ylab = "Voltage")

## plot datetime and Global_reactive_power
plot(datetime, as.numeric(subdata$Global_reactive_power), type ="l", xlab = "datetime",
     ylab = "Global_reactive_power")


dev.off()
