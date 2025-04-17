# Imposto layout 2x2 con margini ben calibrati
par(mfrow = c(2, 2),       # 2 righe, 2 colonne
    mar = c(4, 4, 2, 1),   # margini per ogni singolo grafico
    oma = c(0, 0, 2, 0))   # margini esterni (es. per titolo globale, opzionale)

## 1. Global Active Power
plot(subdf$DateTime, subdf$Global_active_power,
     type = "l",
     col = "black",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     main = "",
     xaxt = "n") # Disable x-axis
#Add axis with POSIXct
axis.POSIXct(1,
             at = seq(min(subdf$DateTime),
                      max(subdf$DateTime),
                      by = "6 hours"),
             format = "%a")


## 2. Voltage
plot(subdf$DateTime, subdf$Voltage,
     type = "l",
     col = "black",
     xlab = "datetime",
     ylab = "Voltage",
     main = "",
     xaxt = "n") # Disable x-axis
#Add axis with POSIXct
axis.POSIXct(1,
             at = seq(min(subdf$DateTime),
                      max(subdf$DateTime),
                      by = "6 hours"),
             format = "%a")


## 3. Sub metering (con 3 linee)
plot(subdf$DateTime, subdf$Sub_metering_1,
     type = "n",
     xlab = "",
     ylab = "Energy sub metering",
     xaxt = "n") # Disable x-axis)

lines(subdf$DateTime, subdf$Sub_metering_1, col = "black")
lines(subdf$DateTime, subdf$Sub_metering_2, col = "red")
lines(subdf$DateTime, subdf$Sub_metering_3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1, bty = "n", cex = 0.8)
#Add axis with POSIXct
axis.POSIXct(1,
             at = seq(min(subdf$DateTime),
                      max(subdf$DateTime),
                      by = "6 hours"),
             format = "%a")

## 4. Global Reactive Power
plot(subdf$DateTime, subdf$Global_reactive_power,
     type = "l",
     col = "black",
     xlab = "datetime",
     ylab = "Global Reactive Power",
     main = "",
     xaxt = "n") # Disable x-axis)
#Add axis with POSIXct
axis.POSIXct(1,
             at = seq(min(subdf$DateTime),
                      max(subdf$DateTime),
                      by = "6 hours"),
             format = "%a")

# Salvo il grafico in un file PNG
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()  # Close graphic device
