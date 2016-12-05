#setwd("~/Downloads/Data Science Specialization/R for coursera/Course 4")
#read data
data = read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data$Date = as.Date(data$Date, format="%d/%m/%Y")
#subset to dates we need
subset = subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(subset$Date), subset$Time)
subset$Datetime <- as.POSIXct(datetime)

plot(subset$Global_active_power~subset$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

#save to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()