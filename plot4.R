data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data <- subset(data, as.character(Date) == "1/2/2007" | as.character(Date) == "2/2/2007")
data <- subset(data, as.character(Global_active_power) != "?")
tmp <- paste(data$Date, data$Time)
tmp <- as.POSIXlt(tmp, format = "%d/%m/%Y %H:%M:%S" )
data$datetime <- tmp

par(mfrow = c(2,2))
plot(x = data$datetime, y =as.numeric(as.character(data$Global_active_power)), type ="l", xlab = "", ylab = "Global Active Power")
plot(x = data$datetime, y =as.numeric(as.character(data$Voltage)), type ="l", xlab = "datetime", ylab = "Voltage")
plot(x = data$datetime, y =as.numeric(as.character(data$Sub_metering_1)), type ="l", xlab = "", ylab = "Energy sub metering")
lines(x = data$datetime, y=as.numeric(as.character(data$Sub_metering_2)), col = "red")
lines(x = data$datetime, y=as.numeric(as.character(data$Sub_metering_3)), col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, col = c("black", "red", "blue"),  bty = "n", cex = 0.6)
plot(x = data$datetime, y =as.numeric(as.character(data$Global_reactive_power)), type ="l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off()