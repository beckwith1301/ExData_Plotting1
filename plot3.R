plot3 < - function() {
        
        #read in data
        filename<-"household_power_consumption.txt"
        data1<-read.delim(filename,header=TRUE,sep=";")
        data1$Date<-dmy(data1$Date)
        
        #filter out only 2 days we want
        datemin<-ymd("2007-02-01")
        datemax<-ymd("2007-02-02")
        data1<-filter(data1,Date==datemin | Date==datemax)
        data1$Date<-paste(data1$Date,data1$Time)
        data1$Date<-ymd_hms(data1$Date)
        
        #select sub meter data and covert to numeric
        sub1<-as.numeric(as.character(data1$Sub_metering_1))
        sub2<-as.numeric(as.character(data1$Sub_metering_2))
        sub3<-as.numeric(as.character(data1$Sub_metering_3))
        
        #plot and save png
        png(filename="plot3.png")
        plot(data1$Date,sub1,type="l",xlab="",ylab="Energy sub metering")
        points(data1$Date,sub2,type="l",col="red")
        points(data1$Date,sub3,type="l",col="blue")
        legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
        dev.off()
}
