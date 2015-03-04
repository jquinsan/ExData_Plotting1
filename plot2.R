plot2 <- function () {
        data.colnames <- read.table ("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=1)
        data.colnames <- names (data.colnames)
        data <- read.table ("household_power_consumption.txt", header=TRUE, sep=";", col.names=data.colnames, na.strings="?", nrows=5000, skip=65000)
        data$Date <- as.Date (data$Date, "%d/%m/%Y")
        data$Time <- as.POSIXct(paste (as.character(data$Date), data$Time, sep=" "))
        data <- data [data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]
        plot (data$Time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
}