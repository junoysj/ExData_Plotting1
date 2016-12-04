#setwd("~/Downloads/Data Science Specialization/R for coursera/Course 4")
#read data
data = read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data$Date = as.Date(data$Date, format="%d/%m/%Y")
#subset to dates we need
subset = subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(subset$Date), subset$Time)
subset$Datetime <- as.POSIXct(datetime)

with(subset, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"), cex=0.6)


#save to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()