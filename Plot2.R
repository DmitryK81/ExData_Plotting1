# NB! Before use this script please download file household_power_consumption.txt
# in your working directory

# Read a data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Create a subset from the data
sub_data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Create the second histogram
x <- sub_data$Global_active_power    #Create X and Y values
y <- strptime(paste(sub_data$Date, sub_data$Time, sep = "_"), format = "%d/%m/%Y_%H:%M:%S")

plot(y, x, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Export to PNG file format in your working directory
dev.copy(png, file = "plot2.png")  ## Copy my plot to a PNG file
dev.off()  ## Close the PNG device.