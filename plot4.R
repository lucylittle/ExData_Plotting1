# Using the data for 2007-02-01 and 2007-02-02. Load the data for
# those two days in Plot 2 use a plottype graph to show 4 plots:
# Global_avtive_power, Energy_sub_metering, Voltage, and Global_
# inactive_power in one PNG file created by the code name plot4.R.
# The code # should include reading the data so the plot can be produced.
# The code should also include the code to create the PNG (plot4.png)
# file. 

# set working directory
dataDir <- "C:/Users/Lucy/Documents/University_Training/JohnHopkinsUniv/ExploratoryDataAnalysis/Data/Week1"
setwd(dataDir)

# read data
data <- read.csv(file="household_power_consumption.txt", na.string="?", sep=";")


# Use the create subset for plot4.R
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

# Combine the Date and Time variables

data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

# open a PNG device
png("plot4.png", width=480, height=480)

# set the par()
par(mfrow=c(2,2))

# plot the  line graph for Global_active_power
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# plot the  line graph for Voltage
plot(data$DateTime, data$Voltage, type="l", xlab="datatime", ylab="Voltage")

# plot the multi-color line graph
plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
# add adition lines to the graph
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
# create legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1)

# plot the line graph for Global_reactive_power
plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# close screen device
dev.off()
