library("data.table") 

#Reads in data 
col <- c(Voltage="numeric", Global_active_power="numeric", Global_intensity="numeric" ,Sub_metering_1="numeric", Sub_metering_2="numeric",  Sub_metering_3="numeric", Global_active_power="numeric", Global_reactive_power="numeric")
DT <-read.table("household_power_consumption.txt", header=TRUE, sep=";",dec=".", stringsAsFactors=FALSE, na.strings = "?",colClasses=col)
# Change Date Column to Date Type
neededDT <- DT[DT$Date %in% c("1/2/2007","2/2/2007"),]
datetime <- strptime(paste(neededDT$Date, neededDT$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Global_Active_Power <- as.numeric(neededDT$Global_active_power)


png("plot4.png")

par(mfrow=c(2,2))

# Plot 1
plot(datetime, powerDT$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Plot 2
plot(datetime,powerDT$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot 3
plot(datetime, powerDT$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines( datetime, powerDT$Sub_metering_2, col="red")
lines(datetime, powerDT$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "), lty=c(1,1), bty="n", cex=.5)

# Plot 4
plot(datetime, powerDT$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
