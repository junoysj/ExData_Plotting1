#setwd("~/Downloads/Data Science Specialization/R for coursera/Course 4")
#read data
data = read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data$Date = as.Date(data$Date, format="%d/%m/%Y")
#subset to dates we need
subset = subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(subset$Date), subset$Time)
subset$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subset, {
    plot(Global_active_power~Datetime, type="l", ylab="Global Active Power", xlab="")
    plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="datetime")
    plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="o")
    #legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))   #bty="n", remove the box
    plot(Global_reactive_power~Datetime, type="l", ylab="Global_Rective_Power",xlab="datetime")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()