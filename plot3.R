electricPowerConsumption <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings ="?")
electricPowerConsumption$Time <- paste(electricPowerConsumption$Date, electricPowerConsumption$Time, sep=" ")
electricPowerConsumption$Date <- as.Date(electricPowerConsumption$Date, "%d/%m/%Y")
index <- electricPowerConsumption$Date == "2007-02-01" | electricPowerConsumption$Date == "2007-02-02"
electricPowerConsumption <- electricPowerConsumption[index,]
electricPowerConsumption$Time <- strptime(electricPowerConsumption$Time, "%d/%m/%Y %H:%M:%S")

############################
# Plot 3
############################
png(filename = "plot3.png",width = 480, height = 480)
with(electricPowerConsumption,plot(Time, Sub_metering_1, xlab = "", ylab="Energy sub metering", type="l", col="violetred"))
with(electricPowerConsumption,lines(Time, Sub_metering_2, col="red"))
with(electricPowerConsumption,lines(Time, Sub_metering_3, col="blue"))
legend("topright", lty=1, col = c("violetred", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

