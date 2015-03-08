#setwd("D:/Coursera/Exploratory Data Analysis")

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, nrows = 2075259)

df$Date <- as.Date(df$Date, "%d/%m/%Y")

df <- df[(df$Date == "2007-02-01" | df$Date == "2007-02-02"), ]

#df$Time <- as.POSIXlt(df$Time)

df$Global_active_power <- as.numeric(df$Global_active_power)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
df$Voltage <- as.numeric(df$Voltage)
df$Global_intensity <- as.numeric(df$Global_intensity)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)


png(filename = "plot1.png", width = 480, height = 480)

hist(df$Global_active_power, main = "Global Active Power", xlab = "Gobal Active Power (kilowatts)", col = "red")

dev.off()


##cleanup
rm(list=ls())