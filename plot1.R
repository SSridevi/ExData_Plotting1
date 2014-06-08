## read the txt file into R
power<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
## Subset the file to just the 2 days of interest
power[,1]<-as.Date(power[,1],"%d/%m/%Y")
dat1<-power[power$Date==as.Date("2007-02-01"),]
dat2<-power[power$Date==as.Date("2007-02-02"),]
dat3<-rbind(dat1,dat2)
dat3$datetime<-strptime(paste(dat3$Date,dat3$Time),"%Y-%m-%d %H:%M:%S")
dat3$Global_active_power<-as.numeric(as.character(dat3$Global_active_power))
## Histogram plot of Global Active Power
png(filename="plot1.png",width=480,height=480)
hist(dat3$Global_active_power,main="Plot1 - Global Active Power",xlab="Global Active Power
     (Kilowatts)",ylab="Frequency",col="red")
dev.off()
