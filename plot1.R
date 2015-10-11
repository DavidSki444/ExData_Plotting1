electricPowerConsumption <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings ="?")
electricPowerConsumption$Time <- paste(electricPowerConsumption$Date, electricPowerConsumption$Time, sep=" ")
electricPowerConsumption$Date <- as.Date(electricPowerConsumption$Date, "%d/%m/%Y")
index <- electricPowerConsumption$Date == "2007-02-01" | electricPowerConsumption$Date == "2007-02-02"
electricPowerConsumption <- electricPowerConsumption[index,]
electricPowerConsumption$Time <- strptime(electricPowerConsumption$Time, "%d/%m/%Y %H:%M:%S")

############################
# Plot 1
############################
png(filename = "plot1.png",width = 480, height = 480)
with(electricPowerConsumption,hist(Global_active_power, xlab="Global Active Power (kilowatts)", main = "Global Active Power", col="red"))
dev.off()
