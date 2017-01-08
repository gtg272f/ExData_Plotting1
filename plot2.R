
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
png(filename = "plot2.png",width = 480, height = 480, units = "px" )

#create Plot
plot(filteredData$Global_active_power,type="l",ylab="Global Acitve Power (kilowatts)", xaxt = "n",xlab="")

#Modify the x-axis of plot
axis(1,at=c(0,1440,2881),labels=c("Thu","Fri","Sat"))

#close png file
dev.off()