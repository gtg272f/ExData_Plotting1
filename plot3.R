
# Read the Data into the data variable
data<-read.table("household_power_consumption.txt",sep=";"
                 ,header=T,stringsAsFactors=F,na.strings="?")

# Convert the Date column to R format dates
data$Date<-as.Date(data$Date,"%d/%m/%Y")

# Convert the Time column to R format times
data$Time<-strptime(data$Time,format="%H:%M:%S",tz="")

# Create a start date and end date in R date format to use for filtering
startDate<-as.Date("2007/02/01","%Y/%m/%d")
endDate<-as.Date("2007/02/02","%Y/%m/%d")

# Filter out the required dates from the data
filteredData<-data[data$Date>=startDate,]
filteredData<-filteredData[filteredData$Date<=endDate,]

# open a png graphics device for saving files
png(filename = "plot3.png",width = 480, height = 480, units = "px" )

#Create plot for Sub_metering_1
plot(filteredData$Sub_metering_1,type="l",ylab="Energy sub metering", xaxt = "n",col="black",xlab="")

#Create plot for Sub_metering_2 without overwriting
lines(filteredData$Sub_metering_2,type="l",ylab="Energy sub metering", xaxt = "n",col="red")

#Create plot for Sub_metering_3 without overwriting
lines(filteredData$Sub_metering_3,type="l",ylab="Energy sub metering", xaxt = "n",col="blue")

#Create legend for plot
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","blue","red"))

#Modify the x-axis of plot
axis(1,at=c(0,1440,2881),labels=c("Thu","Fri","Sat"))

#close png file
dev.off()