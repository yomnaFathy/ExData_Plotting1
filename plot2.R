## read and subset data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, dec = ".", stringsAsFactors = FALSE)
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## convert Columns Date and Time
datetime <- strptime(paste(subdata$Date, subdata$Time, " "), "%d/%m/%Y %H:%M:%S")

## plot datetime and global active power
png("plot2.png", width = 480, height = 480)
plot(datetime, as.numeric(subdata$Global_active_power), type ="l", xlab = "",
     ylab = "Global Active Power (killowatts)")
dev.off()

