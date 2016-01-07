data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data <- subset(data, as.character(Date) == "1/2/2007" | as.character(Date) == "2/2/2007")
data <- subset(data, as.character(Global_active_power) != "?")
tmp <- paste(data$Date, data$Time)
tmp <- as.POSIXlt(tmp, format = "%d/%m/%Y %H:%M:%S" )
data$datetime <- tmp

plot(x = data$datetime, y =as.numeric(as.character(data$Global_active_power)), type ="l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()