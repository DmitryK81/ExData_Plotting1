# Read a data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Create a subset from the data
sub_data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Create the first histogram
x <- sub_data$Global_active_power
hist(x, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", 
        ylab = "Frequency")

# Export to PNG file format in your working directory
dev.copy(png, file = "plot1.png")  ## Copy my plot to a PNG file
dev.off()  ## Close the PNG device.