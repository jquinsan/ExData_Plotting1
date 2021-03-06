plot1 <- function () {
        
        ## Read data and select between 2007-02-01 and 2007-02-02
        data.colnames <- read.table ("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=1)
        data.colnames <- names (data.colnames)
        data <- read.table ("household_power_consumption.txt", header=TRUE, sep=";", col.names=data.colnames, na.strings="?", nrows=5000, skip=65000)
        data$Date <- as.Date (data$Date, "%d/%m/%Y")
        data$Time <- as.POSIXct(paste (as.character(data$Date), data$Time, sep=" "))
        data <- data [data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]
        
        ## Plot an save
        png ("plot1.png")
        hist (data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col=2)
        dev.off()        
}