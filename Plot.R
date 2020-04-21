## Aim of this function is to 
   ## read the household_power_consumption.txt file
   ## subset for data taken from 2 days: 2007-02-01 and 2007-02-02
   ## generate a plot of global active power vs. time

setwd("C:/Users/StelianaBarbu/Desktop/Rdoc/Reproducible_Research_Week_1-master")
dir()
data <- read.csv("~/Exploratory Data Analysis/household_power_consumption.txt", sep=";", na.strings="?",stringsAsFactors = FALSE)
df<-read.table("household_power_consumption.txt", header = T, sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?") ## reads data
dataplott<- subset(df,df$Date=="1/2/2007"|df$Date=="2/2/2007")
datetime <- strptime(paste(dataplott$Date, dataplott$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


## create Plot1
plot1 <- function() {
        hist(dataplott$Global_active_power,col="red",xlab="Global Active Power(kilowatts)",
             main="Global Active Power")
        dev.copy(png, file="plot1.png", width=480, height=480)
        dev.off()
}
plot1()


##create Plot2
plot2 <- function() {
        plot(datetime,dataplott$Global_active_power,ylab="Global Active Power(kilowatts)",
             xlab="",type="l")
        dev.copy(png, file="plot2.png", width=480, height=480)
        dev.off()
}
plot2()


##Create Plot3
plot3 <- function() {
        plot(datetime,dataplott$Sub_metering_1,type="n",xlab = "",ylab="Energy sub metering")
        lines(datetime,dataplott$Sub_metering_1,col="black")
        lines(datetime,dataplott$Sub_metering_2,col="red")
        lines(datetime,dataplott$Sub_metering_3,col="blue")
        legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_meeting_1","Sub_meeting_2"
                                                                            ,"Sub_meeting_3"))
        dev.copy(png, file="plot3.png", width=480, height=480)
        dev.off()
}
plot3()


##Create Plot4
plot4 <- function(){
        plot(datetime,dataplott$Global_active_power,ylab="Global Active Power",
              xlab="",type="l")
        plot(datetime,dataplott$Voltage,ylab="Voltage",type="l")
        plot(datetime,dataplott$Sub_metering_1,type="n",xlab = "",ylab="Energy sub metering")
        lines(datetime,dataplott$Sub_metering_1,col="black")
        lines(datetime,dataplott$Sub_metering_2,col="red")
        lines(datetime,dataplott$Sub_metering_3,col="blue")
        legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_meeting_1","Sub_meeting_2"
                                                                            ,"Sub_meeting_3"))
        plot(datetime,dataplott$Global_reactive_power,type="l",ylab="Global_reactive_power")
        dev.copy(png, file="plot4.png", width=480, height=480)
        dev.off()
}
