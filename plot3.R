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

##Plot 3
png("plot3.png", height=480, width=480)
with(data_sub, {
    plot(Sub_metering_1 ~ DateTime, type="l", xlab="", ylab="Energy sub metering")
    lines(Sub_metering_2 ~ DateTime, col="red")
    lines(Sub_metering_3 ~ DateTime, col="blue")
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
