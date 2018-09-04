png(filename = "plot1.png",width = 480, height = 480)

House_PC <- read.table("household_power_consumption.txt",stringsAsFactors = FALSE,sep = ";",col.names = c("Date","Time","GAP","GRP","Voltage","GI","SM1","SM2","SM3"),skip = grep("1/2/2007",readLines("household_power_consumption.txt"))-1,nrows = 2880)

hist(House_PC$GAP, main = "Global Active Power", xlab = "Global Active Power(kilowatts)", col = "red")

dev.off()
