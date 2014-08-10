## download full file from 
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## wherever you uncompress the file then make that your working directory
## set the working directory
setwd("c:/_coursera")  # use / instead of \ in windows

## access source dataset
data_src <- read.csv("./data/household_power_consumption.txt", header=T, sep=';',
                     na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_src$Date <- as.Date(data_src$Date, format="%d/%m/%Y")
## nrow(data_full) ## count rows in large dataframe

## create a smaller dataframe of the dates that we need
data <- subset(data_src, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
##rm(data_src) ## remove the large file if you want

## convert the Date and Time variables to Date/Time classes 
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## plot3
with(data, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## save to png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()