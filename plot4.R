##Getting "Electric power consumption dataset"
plot4<-read.csv("/Users/Vijeta/Documents/DataScience/Exploratory Data Analysis/Course Project 1/household_power_consumption.txt", header =T, sep=';', na.strings="?", nrows=2075259,check.names=F , stringsAsFactors=F,comment.char="", quote='\"')
plot4$Date<-as.Date(plot4$Date, format="%d/%m/%Y")

##Need to subset data to certain dates
subplot4<-subset(plot4,subset=(Date>="2007-02-01" & Date <= "2007-02-02"))

##Remove bigger file
rm(plot4)


##Converting dates

datetime<- paste(as.Date(subplot4$Date), subplot4$Time)

subplot4$datetime<- as.POSIXct(datetime)

##Assigning width and height 

png("plot4.png", width=480, height=480)


##Saving file in certain location 

png (file = "/Users/Vijeta/Documents/DataScience/Exploratory Data Analysis/Course Project 1/plot4.png")
##Create the fourth plot (Plot 4)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subplot4, {
  plot(Global_active_power~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~datetime, type="l", 
       ylab="Global Reactive (kilowatts)",xlab="")
})

##Turning off plotting device
dev.off()