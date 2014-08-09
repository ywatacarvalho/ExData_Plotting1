

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

with(power1, hist(Global_active_power, breaks = 12, col = "red", 
                  main = "Global Active Power", xlab = "Global Active Power (kilowatts)"));

png(file = "plot1.png", width = 480, height = 480, units = "px");
with(power1, hist(Global_active_power, breaks = 12, col = "red", 
                  main = "Global Active Power", xlab = "Global Active Power (kilowatts)"));
dev.off();

