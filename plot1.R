data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data <- subset(data, as.character(Date) == "1/2/2007" | as.character(Date) == "2/2/2007")
data <- subset(data, as.character(Global_active_power) != "?")

hist(as.numeric(as.character(data$Global_active_power)), xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")

dev.copy(png, file = "plot1.png")
dev.off()