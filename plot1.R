## This script filter plot a histogram of the Global Active Power

# First is essential loading the data in a variable called house_pc
# Here we only use the rows of the days 01/02/2007 and 02/02/2007
house_pc <- read.table('household_power_consumption.txt', sep = ';', 
                       na.strings = '?', skip = 66637, nrows = 2880)
colnames(house_pc) <- c("Date", "Time", "Global_active_power",
                        "Global_reactive_power", "Voltage", "Global_intensity",
                        "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Now is time to open the device for the png files
png(filename = 'plot1.png')
# We create the histogram similar to the the example
hist(house_pc$Global_active_power, col = 'red', main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)')
# And now we close the device
dev.off()
