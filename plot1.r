library("data.table") 

#Reads in data 
cls <- c(Voltage="numeric", Global_active_power="numeric", Global_intensity="numeric" ,Sub_metering_1="numeric", Sub_metering_2="numeric",  Sub_metering_3="numeric", Global_active_power="numeric", Global_reactive_power="numeric")
DT <-read.table("household_power_consumption.txt", header=TRUE, sep=";",dec=".", stringsAsFactors=FALSE, na.strings = "?",colClasses=cls)
# Change Date Column to Date Type
neededDT <- DT[DT$Date %in% c("1/2/2007","2/2/2007"),])
as.date(neededDT$Date)
na.omit(neededDT)

## Plot 1
png("plot1.png")
hist(neededDT$Global_active_power, main="Global Active Power", col="Red", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
