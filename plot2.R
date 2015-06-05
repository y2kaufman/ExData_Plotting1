setwd("C:/Users/David/Desktop/Data Science/Exploratory Data Analysis/week one/repo")
library(dplyr)
library(lubridate)
library(sqldf)
library(tcltk)

# Read in only data for Feb 1-2, 2007
hhpc <- read.csv.sql("./data/household_power_consumption.txt",
                  sep = ";", header = T, 
                  sql = "select * from file 
                  where Date in ('1/2/2007', '2/2/2007')")  

# Convert the dates and times  
hhpc <- mutate(hhpc, DateTime = paste(Date, Time))
hhpc$DateTime <- dmy_hms(hhpc$DateTime)

par(mfcol= c(1,1))
with(hhpc, {
     plot(hhpc$DateTime, hhpc$Global_active_power, type = "l",
        xlab ="", 
        ylab ="Global Active Power (kilowatts)")

   dev.copy(png, file="./output/plot2.png")
   dev.off()
   }
 )
dateRun <- date()
dateRun


