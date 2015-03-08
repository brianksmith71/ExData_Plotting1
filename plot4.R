#setwd("D:/Coursera/Exploratory Data Analysis")

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, nrows = 2075259)

df$Date <- as.Date(df$Date, "%d/%m/%Y")

df <- df[(df$Date == "2007-02-01" | df$Date == "2007-02-02"), ]

#df$Time <- as.POSIXlt(df$Time)

df <- transform(df, dateandtime=as.POSIXct(paste(Date, Time)))

df$Global_active_power <- as.numeric(df$Global_active_power)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
df$Voltage <- as.numeric(df$Voltage)
df$Global_intensity <- as.numeric(df$Global_intensity)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)


png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

##plot in upper left
plot(df$dateandtime, df$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")

##plot in upper right
plot(df$dateandtime, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

##plot in lower left
plot(df$dateandtime, df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(df$dateandtime, df$Sub_metering_2, col = "red")
lines(df$dateandtime, df$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1), bty = "n")

##plot in lower right
plot(df$dateandtime, df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()


##cleanup
rm(list=ls())