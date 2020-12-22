## This script plots Sub_metering_1, Sub_metering_2 and Sub_metering_3 in one
## graph and export it as a png file

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
# Finally is time to create the plot!
png(filename = 'plot3.png')
with(house_pc, plot(Date,Sub_metering_1, type = 'n', xlab = '',
                    ylab = 'Energy sub metering'))
with(house_pc, points(Date, Sub_metering_1, type = 'l'))
with(house_pc, points(Date, Sub_metering_2, type = 'l', col = 'red'))
with(house_pc, points(Date, Sub_metering_3, type = 'l', col = 'blue'))
legend('topright', legend = c("Sub_metering_1", "Sub_metering_2",
                              "Sub_metering_3"),
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'))
# And now we close the device
dev.off()