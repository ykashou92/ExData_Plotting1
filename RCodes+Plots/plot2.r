# Download, unzip and load dataset
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
f <- file.path(getwd(), "hpc_dataset.zip")
download.file(url, f)

if(!file.exists("household_power_consumption.txt")) {
        unzip(f)
}

dt <- read.table("C:/Users/Yanal/Documents/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
dt_date_subset <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]
date_time <- strptime(paste(dt_date_subset$Date, dt_date_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(dt_date_subset$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(date_time, globalActivePower, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()