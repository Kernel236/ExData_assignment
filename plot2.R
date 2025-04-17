##Plot2  Global Active Power vs DateTime 
####### ACTIVEPLOT ######
activeplot <- plot(subdf$DateTime, subdf$Global_active_power,
     type = "l",
     lwd = 2,
     col = "steelblue",
     xlab = "Data",
     ylab = "Global Active Power (kilowatts)",
     main = "Global Active Power on 1-2 Feb 2007",
     xaxt = "n")

#Add axis with POSIXct
axis.POSIXct(1,
             at = seq(min(subdf$DateTime),
                      max(subdf$DateTime),
                      by = "6 hours"),
             format = "%a %H:%M")

# Save the plot as a PNG file 480x480 pixels as plot3.png
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()