##Getting "Electric power consumption dataset"
plot3<-read.csv("/Users/Vijeta/Documents/DataScience/Exploratory Data Analysis/Course Project 1/household_power_consumption.txt", header =T, sep=';', na.strings="?", nrows=2075259,check.names=F , stringsAsFactors=F,comment.char="", quote='\"')
plot3$Date<-as.Date(plot3$Date, format="%d/%m/%Y")

##Need to subset data to certain dates
subplot3<-subset(plot3,subset=(Date>="2007-02-01" & Date <= "2007-02-02"))

##Remove bigger file
rm(plot3)


##Converting dates

datetime<- paste(as.Date(subplot3$Date), subplot3$Time)

subplot3$datetime<- as.POSIXct(datetime)

##Assigning width and height 

png("plot3.png", width=480, height=480)


##Saving file in certain location 

png (file = "/Users/Vijeta/Documents/DataScience/Exploratory Data Analysis/Course Project 1/plot3.png")
##Create the third plot (Plot 3)

with(subplot3, {
  plot(Sub_metering_1~datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Turning off plotting device
dev.off()