#reading data from file Donwloaded from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
fileData <-read.csv("household_power_consumption.txt",stringsAsFactors=FALSE,sep=";")
clean<-as.Date(fileData$Date,"%d/%m/%Y") %in% c(as.Date("01/02/2007","%d/%m/%Y"),as.Date("02/02/2007","%d/%m/%Y"))
myData<-fileData[clean,]

#Plot 1
hist(as.numeric(myData$Global_active_power),breaks=6,col="red",main="Global Active Power", xlab="Global Active Power(kilowatts")
dev.copy(png,"plot1.png")
dev.off()