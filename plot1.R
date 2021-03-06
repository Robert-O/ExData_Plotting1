## set working directory
setwd("~/Rworkspace/ExploratoryDataAnalysis/PeerAssignment_1/ExData_Plotting1")

## read .txt file
allData = read.table(file = 'household_power_consumption.txt', header = TRUE,
                     sep = ';', stringsAsFactors = FALSE)
##str(allData)
##head(allData, 5)

## subset data to only get 2007-02-01 and 2007-02-02
library(dplyr)
powerData = filter(allData, Date == '1/2/2007' | Date == '2/2/2007')

## convert date and time and add new column
### save table, in case I need to come back
library(data.table)
powerData2 = copy(powerData)
powerData2$DateTime = paste(powerData2$Date, powerData2$Time) 
powerData2$DateTime = strptime(powerData2$DateTime, format= '%d/%m/%Y %H:%M:%S') 


## reset plotting parameters
dev.off()

## plot 1
hist(as.numeric(powerData2[, 'Global_active_power']),
     col='red', xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency',
     main = 'Global Active Power')

## copy to png file
dev.copy(png, 'plot1.png')
dev.off()