setwd("C:/Users/David/Desktop/Data Science/Exploratory Data Analysis/week one/repo")
library(dplyr)
library(lubridate)
library(sqldf)

# Read in only data for Feb 1-2, 2007
hhpc <- read.csv.sql("./data/household_power_consumption.txt", 
                  sep = ";", header = T, 
                  sql = "select * from file 
                  where Date in ('1/2/2007', '2/2/2007')")  

# Convert the dates and times  
hhpc <- mutate(hhpc, DateTime = paste(Date, Time))
hhpc$DateTime <- dmy_hms(hhpc$DateTime)

par(mfcol= c(1,1)) 
# plot to screen  
with(hhpc, {
   plot(DateTime, Sub_metering_1, col = "black", 
     width  = 480,
     height = 480,
     type = "l",
     xlab ="", 
     ylab ="Energy sub metering")
   points(DateTime, Sub_metering_2, type = "l", col = "red")
   points(DateTime, Sub_metering_3, type = "l", col = "blue")
   legend("topright", col=c("black", "red", "blue"), 
         lty=1, lwd=2, bty="o",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
   }
 )

# plot to png file
with(hhpc, {
     png(file="./output/plot3.png")

     plot(DateTime, Sub_metering_1, type = "l", 
          xlab ="", ylab = "Energy sub metering",
          col = "black")

     lines(DateTime, Sub_metering_2, type = "l", 
          xlab ="", ylab = "Energy sub metering",
          col = "red")

     lines(DateTime, Sub_metering_3, type = "l", 
          xlab ="", ylab = "Energy sub metering",
          col = "blue")

     legend("topright", col=c("black", "red", "blue"), 
          lty=1, lwd=2, bty="o",
          legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))     

     dev.off()

   }
  )
dateRun <- date()
dateRun
