library("data.table") 

#Reads in data 
DT <-read.table("household_power_consumption.txt", header=TRUE, sep=";",dec=".", stringsAsFactors=FALSE, na.strings = "?")
# Change Date Column to Date Type
neededDT <- DT[DT$Date %in% c("1/2/2007","2/2/2007"),]
datetime <- strptime(paste(neededDT$Date, neededDT$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Global_Active_Power <- as.numeric(neededDT$Global_active_power)
png("plot2.png")

## Plot 2
plot(datetime,Global_Active_Power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()