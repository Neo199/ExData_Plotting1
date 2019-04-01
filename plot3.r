library("data.table") 

#Reads in data 
col <- c(Voltage="numeric", Global_active_power="numeric", Global_intensity="numeric" ,Sub_metering_1="numeric", Sub_metering_2="numeric",  Sub_metering_3="numeric", Global_active_power="numeric", Global_reactive_power="numeric")
DT <-read.table("household_power_consumption.txt", header=TRUE, sep=";",dec=".", stringsAsFactors=FALSE, na.strings = "?",colClasses=col)
# Change Date Column to Date Type
neededDT <- DT[DT$Date %in% c("1/2/2007","2/2/2007"),]
datetime <- strptime(paste(neededDT$Date, neededDT$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Global_Active_Power <- as.numeric(neededDT$Global_active_power)

png("plot3.png")

# Plot 3
plot(datetime, neededDT$Sub_metering_1, type="l", ylab="Energy sub metering")
lines(powerDT$dateTime, powerDT$Sub_metering_2,col="red")
lines(powerDT$dateTime, powerDT$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

dev.off()