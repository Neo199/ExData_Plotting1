library("data.table") 

#Reads in data 
col <- c(Voltage="numeric", Global_active_power="numeric", Global_intensity="numeric" ,Sub_metering_1="numeric", Sub_metering_2="numeric",  Sub_metering_3="numeric", Global_active_power="numeric", Global_reactive_power="numeric")
DT <-read.table("household_power_consumption.txt", header=TRUE, sep=";",dec=".", stringsAsFactors=FALSE, na.strings = "?",colClasses=col)
# Change Date Column to Date Type
neededDT <- DT[DT$Date %in% c("1/2/2007","2/2/2007"),]
as.Date(neededDT$Date)
na.omit(neededDT)

## Plot 2
png("plot2.png")
plot(x = neededDT$dateTime, y = neededDT$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
