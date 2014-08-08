# Using the data for 2007-02-01 and 2007-02-02. Load the data for
# those two days in Plot 2 use a line graph to graph the Global_
# active_power (in kilowatt) create code name plot2.R. The code 
# should include reading the data so the plot can be produced.
# The code should also include the code to create the PNG (plot2.png)
# file. 

# IMPORTANT: this code must be in the same directory as plot1.R
# and run after plot1.R to take advantage of using the file
# already read in.


# Use the data file created in plot1.R to subset data
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

# Combine the Date and Time variables

data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

# open a PNG device
png("plot2.png", width=480, height=480)

# Plot the  line graph
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# close screen device
dev.off()
