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


# plot to png first then plot to screen


with(hhpc, {
      
      png(file="./output/plot4.png")
      par(mfcol= c(2,2), mar = c(4.1, 4.1, 4.1, 2.1), 
          oma = c(0, 0, 2, 0))
      
      plot(DateTime, Global_active_power, type = "l",
           xlab ="", 
           ylab ="Global Active Power")
      
      #   plot 2
      plot(DateTime,  Sub_metering_1, type = "l", 
           xlab ="", ylab = "Energy sub metering",
           col = "black",)
      
      lines(DateTime, Sub_metering_2, type = "l", 
            xlab ="", ylab = "Energy sub metering",
            col = "red")
      lines(DateTime, Sub_metering_3, type = "l", 
            xlab ="", ylab = "Energy sub metering",
            col = "blue")
            
      legend("topright", col=c("black", "red", "blue"), 
             lty=1, lwd=1, bty="n",
             pt.cex=1, cex=1,
             legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))     
            
      #   plot 3
      plot(DateTime, Voltage, type = "l",
           xlab ="datetime", 
           ylab ="Voltage")
      
      #   plot 4
      plot(DateTime, Global_reactive_power, type = "l",
           xlab ="datetime", 
           ylab ="Global_Reactive_Power")

      dev.off()     
    }
)
      
par(mfcol= c(2,2), mar = c(4.1, 4.1, 4.1, 2.1), 
    oma = c(0, 0, 2, 0))
# plot to screen 
# due to issuess with the legend in graph 3
# plot 1
with(hhpc, {
      plot(DateTime, Global_active_power, type = "l",
           xlab ="", 
           ylab ="Global Active Power")
      
      #   plot 2
      plot(DateTime,  Sub_metering_1, type = "l", 
           xlab ="", ylab = "Energy sub metering",
           col = "black",)
      
      lines(DateTime, Sub_metering_2, type = "l", 
            xlab ="", ylab = "Energy sub metering",
            col = "red")
      lines(DateTime, Sub_metering_3, type = "l", 
            xlab ="", ylab = "Energy sub metering",
            col = "blue")
      
      
      legend("topright", col=c("black", "red", "blue"), 
             lty=1, lwd=2, bty="n", cex=0.5,
             legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))     
      
      
      #   plot 3
      plot(DateTime, Voltage, type = "l",
           xlab ="datetime", 
           ylab ="Voltage")
      
      #   plot 4
      plot(DateTime, Global_reactive_power, type = "l",
           xlab ="datetime", 
           ylab ="Global_Reactive_Power")
      
}
)

      
dateRun <- date()
dateRun
