electricPowerConsumption <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings ="?")
electricPowerConsumption$Time <- paste(electricPowerConsumption$Date, electricPowerConsumption$Time, sep=" ")
electricPowerConsumption$Date <- as.Date(electricPowerConsumption$Date, "%d/%m/%Y")
index <- electricPowerConsumption$Date == "2007-02-01" | electricPowerConsumption$Date == "2007-02-02"
electricPowerConsumption <- electricPowerConsumption[index,]
electricPowerConsumption$Time <- strptime(electricPowerConsumption$Time, "%d/%m/%Y %H:%M:%S")

############################
# Plot 2
############################
png(filename = "plot2.png",width = 480, height = 480)
with(electricPowerConsumption,plot(Time, Global_active_power, xlab = "", ylab="Global Active Power (kilowatts)", type="l"))
dev.off()
