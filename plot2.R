plot2 < - function() {
        
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
        
        #select global power and covert to numeric
        power<-as.numeric(as.character(data1$Global_active_power))
        
        #plot and save png
        png(filename="plot2.png")
        plot(data1$Date,power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
        dev.off()
}
