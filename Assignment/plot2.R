# Read data from file household_power_consumption.txt at current wd
print("Course Project 1, Plot 2")
print("Reading data ...")
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", as.is=T)
print(sprintf("%d observations",nrow(data)))

# Select data
print("Selecting data ...")
data$asDate <- as.Date(data$Date,"%d/%m/%Y") #create date column for selection
d1 <- as.Date("2007-02-01")
d2 <- as.Date("2007-02-02")
tmp1 <- data[data$asDate==d1 | data$asDate==d2,]
tmp1$Timestamp <- strptime(paste(tmp1$Date,tmp1$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
print(sprintf("%d observations",nrow(tmp1)))

# Plot to png file
print("Plotting data ...")
png("plot2.png",bg="transparent") # open png device with transparent background in order to match reference figure
with(tmp1,plot(Timestamp,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off() #close png device
print("Done");
