# Using the data for 2007-02-01 and 2007-02-02. Load the data for
# those two days in Plot 1 use a Histogram to graph the Global_
# active_power (in kilowatt) create code name plot1.R. The code 
# should include reading the data so the plot can be produced.
# The code should also include the code to create the PNG (plot1.png)
# file. 

# set working directory
dataDir <- "C:/Users/Lucy/Documents/University_Training/JohnHopkinsUniv/ExploratoryDataAnalysis/Data/Week1"
setwd(dataDir)

# read data
data <- read.csv(file="household_power_consumption.txt", na.string="?", header=TRUE, sep=";")

# Pull only the needed subset from the data
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

# open a PNG device
png("plot1.png", width=480, height=480)

# plot Histogram
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

# close screen device
dev.off()