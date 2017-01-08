
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
png(filename = "plot1.png",width = 480, height = 480, units = "px" )

#create Plot
hist(filteredData$Global_active_power,main="Global Active Power",ylab="Frequency",xlab="Global Active Power(kilowatts)",col="red")

#close png file
dev.off()