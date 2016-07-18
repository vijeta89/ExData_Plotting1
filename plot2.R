##Getting "Electric power consumption dataset"
plot2<-read.csv("/Users/Vijeta/Documents/DataScience/Exploratory Data Analysis/Course Project 1/household_power_consumption.txt", header =T, sep=';', na.strings="?", nrows=2075259,check.names=F , stringsAsFactors=F,comment.char="", quote='\"')
plot2$Date<-as.Date(plot2$Date, format="%d/%m/%Y")

##Need to subset data to certain dates
subplot2<-subset(plot2,subset=(Date>="2007-02-01" & Date <= "2007-02-02"))

##Remove bigger file
rm(plot2)


##Converting dates

datetime<- paste(as.Date(subplot2$Date), subplot2$Time)

subplot2$datetime<- as.POSIXct(datetime)


#Change to numeric

globalActivePower<- as.numeric(subplot2$Global_active_power)

##Assigning width and height 

png("plot2.png", width=480, height=480)


##Saving file in certain location 

png (file = "/Users/Vijeta/Documents/DataScience/Exploratory Data Analysis/Course Project 1/plot2.png")
##Create the second plot (Plot 2)

plot(subplot2$Global_active_power~subplot2$datetime, type = 'l', ylab="Global Active Power (kilowatts)", xlab="")

##Turning off plotting device
dev.off()