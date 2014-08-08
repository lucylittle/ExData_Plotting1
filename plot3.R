# Using the data for 2007-02-01 and 2007-02-02. Load the data for
# those two days in Plot 2 use a line graph to graph the Energy_
# sub_metering in three colors create code name plot3.R. The code 
# should include reading the data so the plot can be produced.
# The code should also include the code to create the PNG (plot3.png)
# file. 

# set working directory
dataDir <- "C:/Users/Lucy/Documents/University_Training/JohnHopkinsUniv/ExploratoryDataAnalysis/Data/Week1"
setwd(dataDir)

# read data
data <- read.csv(file="household_power_consumption.txt", na.string="?", header=TRUE, sep=";")


# Use the create subset for plot3.R
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

# Combine the Date and Time variables

data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

# open a PNG device
png("plot3.png", width=480, height=480)

# Plot the  line graph
plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
# add adition lines to the graph
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")

# create legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1)

# close screen device
dev.off()
