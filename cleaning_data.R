#####################################################################
########### Math the total RAM needed for whole dataset #############
#####################################################################

# The dataset has 2,075,259 rows and 9 columns
# Total amount of RAM = total numeber of rows * number of columns * 8 bytes
# 2.075259 * 9 * 8 = 149,000,000 bytes. Approximately should be 150MB of free RAM addressable


#Import dataset and libraries
# data from the dates 2007-02-01 and 2007-02-02 (Date = Column1)
library(readr)
library(tidyverse)
library(lubridate)

subdf <- read.table(here::here("data", "household_power_consumption.txt"), 
                    sep = ";", 
                    header = TRUE, 
                    na.strings = "?", 
                    colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                    col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
                    )
# Format Date column
subdf[, "Date"] <- as.Date(subdf[, "Date"], format = "%d/%m/%Y")
# Merge hours and date in a single object with POSIXct
subdf$DateTime <- as.POSIXct(paste(subdf$Date, subdf$Time), format="%Y-%m-%d %H:%M:%S")


#filter for interested dates
subdf <- subdf |>
  filter(Date >= "2007-02-01" & Date <= "2007-02-02")
