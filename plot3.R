## read and subset data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, dec = ".", stringsAsFactors = FALSE)
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## convert Columns Date and Time
datetime <- strptime(paste(subdata$Date, subdata$Time, " "), "%d/%m/%Y %H:%M:%S")

## plot datetime and enregy sub metering
png("plot3.png", width = 480, height = 480)
plot(datetime, as.numeric(subdata$Sub_metering_1), type ="l",  xlab = "",
     ylab = "Energy sub metering")
lines(datetime, as.numeric(subdata$Sub_metering_2), type ="l", col = "red")
lines(datetime, as.numeric(subdata$Sub_metering_3), type ="l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty =1)
dev.off()
