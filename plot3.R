png(filename = "plot3.png",width = 480, height = 480)

House_PC <- read.table("household_power_consumption.txt",stringsAsFactors = FALSE,sep = ";",col.names = c("Date","Time","GAP","GRP","Voltage","GI","SM1","SM2","SM3"),skip = grep("1/2/2007",readLines("household_power_consumption.txt"))-1,nrows = 2880)
FullDate <- parse_date_time(paste(House_PC$Date,House_PC$Time,sep = " "), orders = "dmy HMS")

plot(FullDate,House_PC$SM1,type = "l", xlab = "",ylab = "Energy sub metering")
lines(FullDate,House_PC$SM2,col = "red")
lines(FullDate,House_PC$SM3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = 1)

dev.off()