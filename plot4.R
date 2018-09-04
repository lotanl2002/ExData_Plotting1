png(filename = "plot4.png",width = 480, height = 480)

House_PC <- read.table("household_power_consumption.txt",stringsAsFactors = FALSE,sep = ";",col.names = c("Date","Time","GAP","GRP","Voltage","GI","SM1","SM2","SM3"),skip = grep("1/2/2007",readLines("household_power_consumption.txt"))-1,nrows = 2880)
FullDate <- parse_date_time(paste(House_PC$Date,House_PC$Time,sep = " "), orders = "dmy HMS")

par(mfrow = c(2,2))

plot(FullDate,House_PC$GAP, type = "l",xlab = "",ylab = "Global Active Power(kilowatts)")

plot(FullDate,House_PC$Voltage,type = "l", xlab = "datetime", ylab = "Voltage")

plot(FullDate,House_PC$SM1,type = "l", xlab = "",ylab = "Energy sub metering")
lines(FullDate,House_PC$SM2,col = "red")
lines(FullDate,House_PC$SM3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = 1)


plot(FullDate,House_PC$GRP, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()