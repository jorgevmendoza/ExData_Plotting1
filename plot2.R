#reading data from file Donwloaded from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
fileData <-read.csv("household_power_consumption.txt",stringsAsFactors=FALSE,sep=";")
clean<-as.Date(fileData$Date,"%d/%m/%Y") %in% c(as.Date("01/02/2007","%d/%m/%Y"),as.Date("02/02/2007","%d/%m/%Y"))
myData<-fileData[clean,]

#Plot 2
plot(as.numeric(myData$Global_active_power),main="Global Active Power",type="l", ylab="Global Active Power(kilowatts)",xlab="",axes=FALSE)
axis(1, at = c(0,1500,2900),labels = c("Thu","Fri","Sat"))
axis(2,at=c(0,2,4,6))
box(lty = 1, col = 'black')
dev.copy(png,"plot2.png")
dev.off