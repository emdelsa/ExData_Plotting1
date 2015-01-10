# Read data from file household_power_consumption.txt at current wd
print("Course Project 1, Plot 1")
print("Reading data ...")
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?",as.is=T)

# Format date and time columns
print("Formatting data ...")
data$asDate <- as.Date(data$Date,"%d/%m/%Y")

# Select data
print("Selecting data ...")
d1 <- as.Date("2007-02-01")
d2 <- as.Date("2007-02-02")
tmp1 <- data[data$asDate==d1 | data$asDate==d2,]

# Plot histogram to png file
print("Plotting data ...")
png("plot1.png",bg="transparent") # open png device with transparent background in order to match reference figure
hist(tmp1$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off() #close png device
print("Done");