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

##Plot 2
plot(data_sub$Global_active_power ~ data_sub$DateTime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
