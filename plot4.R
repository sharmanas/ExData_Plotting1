##Reading full dataset
datafile <- "./data/household_power_consumption.txt"
data_full <- read.csv(datafile, sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE)

##Converting Date variable format
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

##Subsetting the dataset
data_sub <- subset(data_full, Date=="2007-02-01" | Date=="2007-02-02")
rm(data_full)

##Converting DateTime variable format
data_sub$DT <- paste(data_sub$Date, data_sub$Time)
data_sub$DateTime <- as.POSIXct(data_sub$DT)

##Plot 4
png("plot4.png", height=480, width=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data_sub, {
    plot(Global_active_power ~ DateTime, type="l", xlab="", ylab="Global Active Power")
    plot(Voltage ~ DateTime, type="l", xlab="datetime", ylab="Voltage")
    plot(Sub_metering_1 ~ DateTime, type="l", xlab="", ylab="Energy sub metering")
    lines(Sub_metering_2 ~ DateTime, col="red")
    lines(Sub_metering_3 ~ DateTime, col="blue")
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power ~ DateTime, type="l", xlab="datetime")
})
dev.off()
