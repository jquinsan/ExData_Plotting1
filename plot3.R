plot3 <- function () {
        
        ## Read data and select between 2007-02-01 and 2007-02-02
        Sys.setlocale("LC_TIME", "English")
        data.colnames <- read.table ("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=1)
        data.colnames <- names (data.colnames)
        data <- read.table ("household_power_consumption.txt", header=TRUE, sep=";", col.names=data.colnames, na.strings="?", nrows=5000, skip=65000)
        data$Date <- as.Date (data$Date, "%d/%m/%Y")
        data$Time <- as.POSIXct(paste (as.character(data$Date), data$Time, sep=" "))
        data <- data [data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]
        
        ## Plot and save
        png ("plot3.png")
        
        ## Plot series
        plot (data$Time, data$Sub_metering_1, type="l", col=1, xlab="", ylab="Energy sub metering")
        points (data$Time, data$Sub_metering_2, type="l", col=2)
        points (data$Time, data$Sub_metering_3, type="l", col=4)
        
        ## Plot legend
        names.legend <- data.colnames [7:9]
        legend ("topright", names.legend, lty=c(1,1,1), lwd=c(1,1,1), col=c(1,2,4))
        
        dev.off()
}