active_power<-read.table("household_power_consumption.txt",header = TRUE, sep= ";")


active_power$DateTime<-paste(active_power$Date, data$Time)

#Modify Date and Time to appropriate format

active_power$DateTime<-strptime(active_power$DateTime, "%d/%m/%Y %H:%M:%S")

# extract 2007-02-01 and 2007-02-02

fromDate <-which(active_power$DateTime==strptime("2007-02-01", "%Y-%m-%d"))

toDate <-which(active_power$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))

global_active_power<-active_power[start:end,]

#plot data

png(file="plot4.png", width=480, height=480)

par(mfcol=c(2,2))

plot(global_active_power$DateTime,as.numeric(as.character(global_active_power$Global_active_power)),type="l",
     main="",
     ylab="Global Active Power",xlab="")

plot(global_active_power$DateTime,as.numeric(as.character(global_active_power$Sub_metering_1)), type="l",
     main="",
     ylab="Energy sub metering", xlab="")

lines(global_active_power$DateTime,as.numeric(as.character(global_active_power$Sub_metering_2)), type="l",
      main="",
      ylab="Energy sub metering", xlab="",col="red")
lines(global_active_power$DateTime,as.numeric(as.character(global_active_power$Sub_metering_3)), type="l",
      main="",
      ylab="Energy sub metering", xlab="",col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),col=c("black","red","blue"),bty = "n")

plot(global_active_power$DateTime,as.numeric(as.character(global_active_power$Voltage)),type="l",
     main="",
     ylab="Voltage",xlab="datetime")

plot(global_active_power$DateTime,as.numeric(as.character(global_active_power$Global_reactive_power)),type="l",
     main="",
     ylab="Global_reactive_power",xlab="datetime")

dev.off()
