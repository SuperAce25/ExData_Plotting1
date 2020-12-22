## This script plot a histogram of Date vs. Global Active Power

# First is essential loading the data in a variable called house_pc
# Here we only use the rows of the days 01/02/2007 and 02/02/2007
house_pc <- read.table('household_power_consumption.txt', sep = ';', 
                       na.strings = '?', skip = 66637, nrows = 2880)
colnames(house_pc) <- c("Date", "Time", "Global_active_power",
                        "Global_reactive_power", "Voltage", "Global_intensity",
                        "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Then we concatenated the columns Date and Time to ease the manipulation of data
house_pc <- mutate(house_pc, Date = paste(Date, Time))
# And we discard the Time column
house_pc <- house_pc[,-2]
# Now, we change the type of the Date column from 'character' to 'Date' using the
# corresponding format
house_pc$Date <- strptime(house_pc$Date, format = '%d/%m/%Y %H:%M:%S')
# Finally is time to create a line plot data with Date vs. Global Active Power
png(filename = 'plot2.png')
with(house_pc, plot(Date, Global_active_power, type = 'l', xlab = '',
                    ylab = 'Global Active Power (kilowatts)'))
dev.off()