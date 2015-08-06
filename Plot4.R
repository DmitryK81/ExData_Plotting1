# NB! Before use this script please download file household_power_consumption.txt
# in your working directory

# Read a data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Create a subset from the data
sub_data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Create place for 4 hists in 1 window  
par(mfrow = c(2, 2), cex = 0.6)

# Create the first histogram
Pl1_y <- sub_data$Global_active_power    #Create X and Y values
x <- strptime(paste(sub_data$Date, sub_data$Time, sep = "_"), format = "%d/%m/%Y_%H:%M:%S")

plot(x, Pl1_y, type = "l", xlab = "", ylab = "Global Active Power")

# Create the second histogram
Pl2_y <- sub_data$Voltage    #Create X and Y values

plot(x, Pl2_y, type = "l", xlab = "datetime", ylab = "Voltage")

# Create the third histogram 
y1 <- sub_data$Sub_metering_1
y2 <- sub_data$Sub_metering_2
y3 <- sub_data$Sub_metering_3

plot(x, y1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
points(x, y2, col = "red", type = "l")
points(x, y3, col = "blue", type = "l")

# I tried to change lang in x axis, but its don't work correctly in my computer.
# axis(1, at = c(0, 1440, 2880), labels = c("thur.", "fri.", "sat."), las = 0)

# Create a legend
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , cex = 0.9, trace = FALSE, bty = "n")

# Create the fourth histogram
Pl4_y <- sub_data$Global_reactive_power    #Create X and Y values
x <- strptime(paste(sub_data$Date, sub_data$Time, sep = "_"), format = "%d/%m/%Y_%H:%M:%S")

plot(x, Pl4_y, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


# Export to PNG file format in your working directory
dev.copy(png, file = "plot4.png", width = 480, height = 480)  ## Copy my plot to a PNG file
dev.off()  ## Close the PNG device.