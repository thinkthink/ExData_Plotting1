# Read Data and extract the data which Date between 2007/02/01 and 2007/02/02
  Data <- read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
  Trans_Data <- transform(Data, Date=as.Date(Date,"%m%d%y"))
  subData <- Data[(Data$Date=='1/2/2007')|(Data$Date=='2/2/2007'),]

# Create a png file 
  png(file="plot1.png",width=480,height=480)
  hist(subData$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
  dev.off()
