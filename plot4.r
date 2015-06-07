Target <- read.csv2("household_power_consumption.txt",
                    header = TRUE, sep = ";", na.strings = "?")

Initial_date <-strptime("01/02/2007", "%d/%m/%Y")
Final_Date   <-strptime("02/02/2007", "%d/%m/%Y")

DatesList <- strptime(Target[,1], "%d/%m/%Y")
IsDaterelevant <- Initial_date <= DatesList & Final_Date >= DatesList
RelevantData <- Target[IsDaterelevant,]
secs_Epoc <- 
    as.integer(as.POSIXct(strptime
                          (paste(RelevantData[,1],RelevantData[,2]), "%d/%m/%Y %H:%M:%S")
    )

to <- as.integer( as.POSIXct( strptime ( paste( RelevantData[,1], RelevantData[,2]), "%d/%m/%Y %H:%M:%S" ) ) )
ga <- as.numeric(as.character(RelevantData[,3]))
gb <- as.numeric(as.character(RelevantData[,5]))
gc <- as.numeric(as.character(RelevantData[,4]))

submet1 <- as.numeric(as.character(RelevantData$"Sub_metering_1"))
submet2 <- as.numeric(as.character(RelevantData$"Sub_metering_2"))
submet3 <- as.numeric(as.character(RelevantData$"Sub_metering_3"))


png("./plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

plot( to, ga, type = "l", xlab="", ylab="Global Active Power (kilowatts)", xaxt='n' )
axis(1, at=c(to[1], to[length(to)/2], to[length(to)]), labels=c("Thu","Fri", "Sat") )

plot( to, gb, type = "l", xlab="datetime", ylab="Voltage", xaxt='n' )
axis(1, at=c(to[1], to[length(to)/2], to[length(to)]), labels=c("Thu","Fri", "Sat") )

plot( to, sub1, type = "l", col="black", xlab="", ylab="Energy sub metering", xaxt='n' )
lines( to, sub2, type = "l", col="red" )
lines( to, sub3, type = "l", col="blue" )
axis(1, at=c(to[1], to[length(to)/2], to[length(to)]), labels=c("Thu","Fri", "Sat") )
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue") )#, lwd=c(2.5,2.5)))

plot( to, gc, type = "l", xlab="datetime", ylab="Global_reactive_power", xaxt='n' )
axis(1, at=c(to[1], to[length(to)/2], to[length(to)]), labels=c("Thu","Fri", "Sat") )

dev.off()
