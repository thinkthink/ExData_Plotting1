# Read the data between 2007/02/01 and 2007/02/02
Data <- read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
Trans_Data <- transform(Data, Date=as.Date(Date,"%m%d%y"))
subData <- Data[(Data$Date=='1/2/2007')|(Data$Date=='2/2/2007'),]

# Create a png file
png(file="plot2.png",width=480,height=480)
plot(subData$Global_active_power, type="o",pch=".",ylab="Global Active Power(kilowatts)",xaxt="n",xlab="") 
axis(1,at=1:3,labels=c("Thu","Fri","Sat"))
par(mar=c(6,6,6,6))
dev.off()
