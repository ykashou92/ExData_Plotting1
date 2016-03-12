# Download and unzip dataset
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
f <- file.path(getwd(), "hpc_dataset.zip")
download.file(url, f)

if(!file.exists("household_power_consumption.txt")) {
        unzip(f)
}

#Load dataset

dt <- read.table("C:/Users/Yanal/Documents/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
dt_date_subset <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]
date_time <- strptime(paste(dt_date_subset$Date, dt_date_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(dt_date_subset$Global_active_power)
globalReactivePower <- as.numeric(dt_date_subset$Global_reactive_power)
Voltage <- as.numeric(dt_date_subset$Voltage)

#Coerce sub_metering columns to be treated as numeric 
sub_metering_1 <- as.numeric(dt_date_subset$Sub_metering_1)
sub_metering_2 <- as.numeric(dt_date_subset$Sub_metering_2)
sub_metering_3 <- as.numeric(dt_date_subset$Sub_metering_3)

#Plotting
png("plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))

plot(date_time, globalActivePower, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(date_time, sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(date_time, sub_metering_2, type="l", col="red")
lines(date_time, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))

plot(date_time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage", )

plot(date_time, globalReactivePower,type = "l", xlab = "datetime", ylab = 	"Global_reactive_power")
dev.off()

