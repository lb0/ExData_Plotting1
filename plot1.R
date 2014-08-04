d = read.csv('household_power_consumption.txt', sep = ";")
d = d[ d$Date %in% c('1/2/2007','2/2/2007'),]
dt <- strptime( paste(d$Date, d$Time, sep=' '), format="%d/%m/%Y %H:%M:%S")

####1
png('plot1.png', width=480, height=480)
hist(as.numeric(as.character(d$Global_active_power)), col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')
dev.off()
