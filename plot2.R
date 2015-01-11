# Set the system language into English
  Sys.setlocale(category = "LC_TIME", locale = "C")

# Read the data between 2007/02/01 and 2007/02/02
  Data <- read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
  Trans_Data <- transform(Data, Date=as.Date(Date,"%m%d%y"))
  subData <- Data[(Data$Date=='1/2/2007')|(Data$Date=='2/2/2007'),]

# Creat new column (DateTime)
  subData$DateTime <- as.POSIXct(paste(subData$Date, subData$Time), format="%d/%m/%Y %H:%M:%S")

# Create a png file
  png(file="plot2.png",width=480,height=480)
  plot(subData$DateTime,subData$Global_active_power, type="l",pch=".",ylab="Global Active Power(kilowatts)",xlab="") 
  par(mar=c(6,6,6,6))
  dev.off()

