## read and subset data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, dec = ".", stringsAsFactors = FALSE)
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## plot histogram
png("plot1.png", width = 480, height = 480)
hist(as.numeric(subdata$Global_active_power), col = "red", xlab = "Global Active Power (killowattas)",
     main = "Global Active Power")
dev.off()
