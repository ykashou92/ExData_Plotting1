# Download and unzip dataset
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
f <- file.path(getwd(), "hpc_dataset.zip")
download.file(url, f)

if(!file.exists("household_power_consumption.txt")) {
        unzip(f)
}

# Load and Explore dataset,
dt <- read.table("C:/Users/Yanal/Documents/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
dim(dt)
head(dt)

# Summary provides details on data types
summary(dt)

# Subset dates 1/2/2007 and 2/2/2007
dt_date_subset <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]
str(dt_date_subset)

# Load associated variables
globalActivePower <- as.numeric(dt_date_subset$Global_active_power)

# Plotting ~ plot2.png
png("plot1.png", width = 480, height = 480)
hist(globalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)", ylab = "Frequency")
dev.off()
