# Set the system into English language 
  Sys.setlocale(category = "LC_TIME", locale = "C")

# Read the data between 2007/02/01 and 2007/02/02
  Data <- read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
  Trans_Data <- transform(Data, Date=as.Date(Date,"%m%d%y"))
  subData <- Data[(Data$Date=='1/2/2007')|(Data$Date=='2/2/2007'),]
  subData$DateTime <- as.POSIXct(paste(subData$Date, subData$Time), format="%d/%m/%Y %H:%M:%S")

# Create a png file
  png(file="plot3.png",width=480,height=480)

# plot 
  plot(subData$Sub_metering_1 ~ subData$DateTime, type="o",pch=".",col="black",ylab="Energy sub metering",xlab="")
  lines(subData$DateTime,subData$Sub_metering_2,col = "red")
  lines(subData$DateTime,subData$Sub_metering_3,col = "blue")

# Add legend
  legend("topright",pch="-",col=c("black","red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))

# Close device
  dev.off()
