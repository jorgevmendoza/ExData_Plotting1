#reading data from file Donwloaded from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
fileData <-read.csv("household_power_consumption.txt",stringsAsFactors=FALSE,sep=";")
clean<-as.Date(fileData$Date,"%d/%m/%Y") %in% c(as.Date("01/02/2007","%d/%m/%Y"),as.Date("02/02/2007","%d/%m/%Y"))
myData<-fileData[clean,]

#Plot 1
hist(as.numeric(myData$Global_active_power),breaks=6,col="red",main="Global Active Power", xlab="Global Active Power(kilowatts")
dev.copy(png,"plot1.png")
dev.off()

#Plot 2
plot(as.numeric(myData$Global_active_power),main="Global Active Power",type="l", ylab="Global Active Power(kilowatts)",xlab="",axes=FALSE)
axis(1, at = c(0,1500,2900),labels = c("Thu","Fri","Sat"))
axis(2,at=c(0,2,4,6))
box(lty = 1, col = 'black')
dev.copy(png,"plot2.png")
dev.off()

#Plot 3
plot(1:nrow(myData),as.numeric(myData$Sub_metering_1),main="", ylab="Energy sub metering",xlab="",type="l",col="black",axes=FALSE)
par(new=T)
plot(as.numeric(myData$Sub_metering_2),col="red",type="l",axes=FALSE,ylim=c(0,40),xlab="",ylab="")
par(new=T)
plot(as.numeric(myData$Sub_metering_3),col="blue",type="l",axes=FALSE,ylim=c(0,40),xlab="",ylab="")
axis(1, at = c(0,1500,2900),labels = c("Thu","Fri","Sat"))
axis(2, at = c(0,10,20,30),labels = c("0","10","20","30"))
legend("topright",legend=c("sub-metering1","sub-metering2","sub-metering3"),col=c("black","red","blue"),lty=c(1,1,1),lwd=2)
box(lty = 1, col = 'black')
dev.copy(png,"plot3.png")
dev.off()

#Plot 4
par(new=F)
par(mfrow=c(2,2))
plot(as.numeric(myData$Global_active_power),main ="Global Active Power",type="l", ylab="Global Active Power(kilowatts)",xlab="",axes=FALSE)
axis(1, at = c(0,1500,2900),labels = c("Thu","Fri","Sat"))
axis(2,at=c(0,2,4,6))
box(lty = 1, col = 'black')
#voltage
plot(as.numeric(myData$Voltage),main="voltage",type="l", ylab="voltage",xlab="",axes=FALSE)
axis(1, at = c(0,1500,2900),labels = c("Thu","Fri","Sat"))
axis(2,at=c(234,238,240,242),labels=c("234","238","240","242"))
box(lty = 1, col = 'black')
#plot3
plot(1:nrow(myData),as.numeric(myData$Sub_metering_1),main="Energy metering", ylab="Energy sub metering",xlab="",type="l",col="black",axes=FALSE)
par(new=T)
plot(as.numeric(myData$Sub_metering_2),col="red",type="l",axes=FALSE,ylim=c(0,40),xlab="",ylab="")
par(new=T)
plot(as.numeric(myData$Sub_metering_3),col="blue",type="l",axes=FALSE,ylim=c(0,40),xlab="",ylab="")
axis(1, at = c(0,1500,2900),labels = c("Thu","Fri","Sat"))
axis(2, at = c(0,10,20,30),labels = c("0","10","20","30"))
legend("topright",legend=c("sub-metering1","sub-metering2","sub-metering3"),col=c("black","red","blue"),lty=c(1,1,1),lwd=2)
box(lty = 1, col = 'black')
par(new=F)
plot(as.numeric(myData$Global_reactive_power),main ="Global Reactive Power",type="l", ylab="",xlab="",axes=FALSE)
axis(1, at = c(0,1500,2900),labels = c("Thu","Fri","Sat"))
axis(2,at=c(0.1,0.2,0.3,0.4),c("0.1","0.2","0.3","0.4"))
box(lty = 1, col = 'black')
dev.copy(png,"plot4.png")
dev.off()