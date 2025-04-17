library(tidyverse)
# Plot vuoto iniziale
plot(subdf$DateTime, subdf$Sub_metering_1,
     type = "n",  # "n" = nothing to draw, allow just to set the frame
     xlab = "DateTime", ylab = "Energy sub metering",
     main = "Sub Metering Energy Usage")

# Aggiungi le 3 linee
lines(subdf$DateTime, subdf$Sub_metering_1, col = "black")
lines(subdf$DateTime, subdf$Sub_metering_2, col = "red")
lines(subdf$DateTime, subdf$Sub_metering_3, col = "blue")

# Aggiungi legenda
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, bty = "n")

# Salva il grafico in un file PNG
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()  
