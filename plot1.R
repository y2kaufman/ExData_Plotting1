setwd("C:/Users/David/Desktop/Data Science/Exploratory Data Analysis/week one/repo")
#install.packages('sqldf')
#install.packages('tcltk')
library(sqldf)
library(tcltk)

# Read in only data for Feb 1-2, 2007
hhpc <- read.csv.sql("./data/household_power_consumption.txt", 
                  sep = ";", header = T, 
                  sql = "select * from file 
                  where Date in ('1/2/2007', '2/2/2007')")  
                     
par(mfcol= c(1,1))
hist(hhpc$Global_active_power, col = "red",
     xlab ="Global Active Power (kilowatts)", 
     main = "Global Active Power")

dev.copy(png, file="./output/plot1.png")
dev.off()

dateRun <- date()
dateRun
