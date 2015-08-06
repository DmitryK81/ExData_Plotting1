# NB! Before use this script please download file household_power_consumption.txt
# in your working directory

# Read a data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Create a subset from the data
sub_data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Create the second histogram 
#Create X and Y values 
x <- strptime(paste(sub_data$Date, sub_data$Time, sep = "_"), format = "%d/%m/%Y_%H:%M:%S")
y1 <- sub_data$Sub_metering_1
y2 <- sub_data$Sub_metering_2
y3 <- sub_data$Sub_metering_3

# Create plot with three lines
par(cex = 0.8)

plot(x, y1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
points(x, y2, col = "red", type = "l")
points(x, y3, col = "blue", type = "l")

# I tried to change lang in x axis, but its don't work correctly in my computer.
# axis(1, at = c(0, 1440, 2880), labels = c("thur.", "fri.", "sat."), las = 0)

# Create a legend
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , cex = 0.9, trace = FALSE)


# Export to PNG file format in your working directory
dev.copy(png, file = "plot3.png", width = 480, height = 480)  ## Copy my plot to a PNG file
dev.off()  ## Close the PNG device.