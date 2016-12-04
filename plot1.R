#setwd("~/Downloads/Data Science Specialization/R for coursera/Course 4")
#read data
data = read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data$Date = as.Date(data$Date, format="%d/%m/%Y")
#subset to dates we need
subset = subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
#plot histogram
hist(subset$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
#save to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
