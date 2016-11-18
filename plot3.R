## set working directory
setwd("~/Rworkspace/ExploratoryDataAnalysis/PeerAssignment_1/ExData_Plotting1")

## read .txt file
allData = read.table(file = 'household_power_consumption.txt', header = TRUE,
                     sep = ';', stringsAsFactors = FALSE)

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

## plot 3
with(powerData2, plot(x = DateTime, y = Sub_metering_1, 
                      type = 'l', xlab = ' ', 
                      ylab = 'Energy sub metering'))
with(powerData2, lines(x = DateTime, y = Sub_metering_2, type = 'l', col = 'red'))
with(powerData2, lines(x = DateTime, y = Sub_metering_3, type = 'l', col = 'blue'))
## adding legend
legend("topright", pch = '-', col = c('Black', 'Red', 'Blue'), 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       pt.cex = 1, lwd = 3)


## copy to png file
dev.copy(png, 'plot3.png')
dev.off()