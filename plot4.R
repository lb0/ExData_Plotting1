d = read.csv('household_power_consumption.txt', sep = ";")
d = d[ d$Date %in% c('1/2/2007','2/2/2007'),]
dt <- strptime( paste(d$Date, d$Time, sep=' '), format="%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "C") # Otherwise weekdays are not english for me!

####4 
png('plot4.png', width=480, height=480)
par(mfrow=c(2,2))
plot(dt, as.numeric(as.character(d$Global_active_power)), type = 'l', xlab='', ylab='Global Active Power')

plot(dt, as.numeric(as.character(d$Voltage)), type = 'l', xlab='datetime', ylab='Voltage')

plot(dt, as.numeric(as.character(d$Sub_metering_1)), type = 'l', xlab='', ylab='Energy sub metering')
lines(dt, as.numeric(as.character(d$Sub_metering_2)), col='red')
lines(dt, as.numeric(as.character(d$Sub_metering_3)), col='blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=1)

plot(dt, as.numeric(as.character(d$Global_reactive_power)), type = 'l', xlab='datetime', ylab='Global_reactive_power')
dev.off()
