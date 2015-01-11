# Set the system into English language 
  Sys.setlocale(category = "LC_TIME", locale = "C")

# Read the data between 2007/02/01 and 2007/02/02 and create a new column(DateTime)
  Data <- read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
  Trans_Data <- transform(Data, Date=as.Date(Date,"%m%d%y"))
  subData <- Data[(Data$Date=='1/2/2007')|(Data$Date=='2/2/2007'),]
  subData$DateTime <- as.POSIXct(paste(subData$Date, subData$Time), format="%d/%m/%Y %H:%M:%S")

# Create a png file
  png(file="plot4.png",width=480,height=480)

# 2x2 plots
  par(mfrow=c(2,2))

# plot - TopLeft
  plot(subData$DateTime,subData$Global_active_power, type="l",pch=".",ylab="Global Active Power(kilowatts)",xlab="") 

# plot - TopRight
  plot(subData$Voltage~subData$DateTime,type="l",xlab="datetime",ylab="Voltage")

# plot - DownLeft
  plot(subData$Sub_metering_1 ~ subData$DateTime, type="o",pch=".",col="black",ylab="Energy sub metering",xlab="")
  lines(subData$DateTime,subData$Sub_metering_2,col = "red")
  lines(subData$DateTime,subData$Sub_metering_3,col = "blue")
  legend("topright",pch="-",col=c("black","red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))

# plot -  DownRight
  plot(subData$Global_reactive_power~subData$DateTime,type="l",xlab="datetime",ylab="Global_reactive_power")

# Close device
  dev.off()
