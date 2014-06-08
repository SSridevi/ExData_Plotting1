## read the txt file into R
power<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
## Subset the file to just the 2 days of interest
power[,1]<-as.Date(power[,1],"%d/%m/%Y")
dat1<-power[power$Date==as.Date("2007-02-01"),]
dat2<-power[power$Date==as.Date("2007-02-02"),]
dat3<-rbind(dat1,dat2)
dat3$datetime<-strptime(paste(dat3$Date,dat3$Time),"%Y-%m-%d %H:%M:%S")
dat3$Global_active_power<-as.numeric(as.character(dat3$Global_active_power))
dat3$Voltage<-as.numeric(as.character(dat3$Voltage))
dat3$Global_reactive_power<-as.numeric(as.character(dat3$Global_reactive_power))
dat3$Sub_metering_1<-as.numeric(as.character(dat3$Sub_metering_1))
dat3$Sub_metering_2<-as.numeric(as.character(dat3$Sub_metering_2))
dat3$Sub_metering_3<-as.numeric(as.character(dat3$Sub_metering_3))
## plot of Global Active Power by Days
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(dat3$datetime,dat3$Global_active_power,ylab="Global Active Power(Kilowatts)",xlab="datetime",type="l")
plot(dat3$datetime,dat3$Voltage,ylab="Voltage",xlab="datetime",type="l")
plot(dat3$datetime,dat3$Sub_metering_1,ylab="Energy Sub Metering",xlab="datetime",type="l")
lines(dat3$datetime,dat3$Sub_metering_2,col="red")
lines(dat3$datetime,dat3$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(dat3$datetime,dat3$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="l")
dev.off()
