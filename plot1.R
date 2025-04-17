# Use baseR to create an Histogram of Global Active Power
hist(subdf$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     col = "steelblue", 
     breaks = 60,
     ylim = c(0, 600),
     xlim = c(0, 6),
     axes = TRUE)
# Save the plot as a PNG file 480x480 pixels as plot1.png
dev.copy(png, file = "plot1.png", width = 480, height = 480)
# Close the device. Really importanto to avoid issues of permission.
dev.off()

