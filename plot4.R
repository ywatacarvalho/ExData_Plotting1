
#--- figure plot4.png

rm(list=ls());

setwd("C:/Alex/AulasWEB/ExploratoryDataAnalysis/Project_1");

power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, dec = ".",
                    colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric"),
                    na.strings = c("?"));

power$datetime <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S");
power$date <- strptime(power$Date, "%d/%m/%Y");

summary(power);

power1 <- subset(power, as.Date(date) <= as.Date('2007-02-02') & as.Date(date) >= as.Date('2007-02-01'))

summary(power1);

Sys.setlocale("LC_TIME", "English");

par(mfrow = c(2,2));
par(mar = c(4,4,2,2));

with(power1, plot(datetime, Global_active_power, type="o", pch='', xlab = "", ylab = "Global Active Power"))
with(power1, plot(datetime, Voltage, type="o", pch='', xlab = "datetime", ylab = "Voltage"))

plot(power1$datetime, power1$Sub_metering_1, type="o", pch='', xlab = "", ylab = "Energy sub metering")
points(power1$datetime, power1$Sub_metering_2, type="o", pch='', xlab = "", col="red")
points(power1$datetime, power1$Sub_metering_3, type="o", pch='', xlab = "", col="blue")

legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n");

with(power1, plot(datetime, Global_reactive_power, type="o", pch='', xlab = "datetime", ylab = "Global_reactive_power"))

png(file = "plot4.png", width = 480, height = 480, units = "px");

par(mfrow = c(2,2));
par(mar = c(4,4,2,2));

with(power1, plot(datetime, Global_active_power, type="o", pch='', xlab = "", ylab = "Global Active Power"))
with(power1, plot(datetime, Voltage, type="o", pch='', xlab = "datetime", ylab = "Voltage"))

plot(power1$datetime, power1$Sub_metering_1, type="o", pch='', xlab = "", ylab = "Energy sub metering")
points(power1$datetime, power1$Sub_metering_2, type="o", pch='', xlab = "", col="red")
points(power1$datetime, power1$Sub_metering_3, type="o", pch='', xlab = "", col="blue")

legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n");

with(power1, plot(datetime, Global_reactive_power, type="o", pch='', xlab = "datetime", ylab = "Global_reactive_power"))

dev.off();

