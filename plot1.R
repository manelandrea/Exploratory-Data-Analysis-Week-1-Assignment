active_power<-read.table("household_power_consumption.txt",header = TRUE, sep= ";")


active_power$DateTime<-paste(active_power$Date, data$Time)

#Modify Date and Time to appropriate format

active_power$DateTime<-strptime(active_power$DateTime, "%d/%m/%Y %H:%M:%S")

# extract 2007-02-01 and 2007-02-02

fromDate <-which(active_power$DateTime==strptime("2007-02-01", "%Y-%m-%d"))

toDate <-which(active_power$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))

global_active_power<-active_power[start:end,]

#plot data

png(file="plot1.png", width=480, height=480)

hist(as.numeric(as.character(global_active_power$Global_active_power)),
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")

dev.off()
