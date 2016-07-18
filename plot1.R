##Getting "Electric power consumption dataset"
plot1<-read.csv("/Users/Vijeta/Documents/DataScience/Exploratory Data Analysis/Course Project 1/household_power_consumption.txt", header =T, sep=';', na.strings="?", nrows=2075259,check.names=F , stringsAsFactors=F,comment.char="", quote='\"')
plot1$Date<-as.Date(plot1$Date, format="%d/%m/%Y")

##Need to subset data to certain dates
subplot1<-subset(plot1,subset=(Date>="2007-02-01" & Date <= "2007-02-02"))

##Remove bigger file
rm(plot1)

##Change to numeric

globalActivePower<- as.numeric(subplot1$Global_active_power)

##Assigning width and height 

png("plot1.png", width=480, height=480)


##Saving file in certain location 

png (file = "/Users/Vijeta/Documents/DataScience/Exploratory Data Analysis/Course Project 1/plot1.png")
##Create the first histogram (Plot 1)

hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

##Turning off plotting device
dev.off()