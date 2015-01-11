# Read data from file household_power_consumption.txt at current wd
print("Course Project 1, Plot 4")
print("Reading data ...")
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", as.is=T)
print(sprintf("%d observations",nrow(data)))

# Select data
print("Selecting data ...")
data$asDate <- as.Date(data$Date,"%d/%m/%Y") #create date column for selection
d1 <- as.Date("2007-02-01")
d2 <- as.Date("2007-02-02")
tmp1 <- data[data$asDate==d1 | data$asDate==d2,]
tmp1$Timestamp <- strptime(paste(tmp1$Date,tmp1$Time,sep=" "),"%d/%m/%Y %H:%M:%S") #create datetime column
print(sprintf("%d observations",nrow(tmp1)))

# Plot to png file
print("Plotting data ...")
png("plot4.png",bg="transparent") # open png device with transparent background in order to match reference figure
par(mfrow=c(2,2))
with(tmp1, {
  plot(Timestamp,Global_active_power,type="l",xlab="",ylab="Global Active Power")
  plot(Timestamp,Voltage,type="l",xlab="datetime",ylab="Voltage")
  plot(Timestamp,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
    points(Timestamp,Sub_metering_1,type="l")
    points(Timestamp,Sub_metering_2,type="l",col="red")
    points(Timestamp,Sub_metering_3,type="l",col="blue")
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1,bty="n",cex=0.8)
  plot(Timestamp,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.off() #close png device
print("Done");