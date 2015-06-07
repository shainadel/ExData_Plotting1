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
)
submet1 <- as.numeric(as.character(RelevantData$"Sub_metering_1"))
submet2 <- as.numeric(as.character(RelevantData$"Sub_metering_2"))
submet3 <- as.numeric(as.character(RelevantData$"Sub_metering_3"))

png(filename = "./plot3.png",width = 480,height = 480) 

plot( secs_Epoc, submet1, type = "l", col="black", xlab="", ylab="Energy sub metering", xaxt='n' )
lines( secs_Epoc, submet2, type = "l", col="red" )
lines( secs_Epoc, submet3, type = "l", col="blue" )
axis(1,at = c(secs_Epoc[1], secs_Epoc[length(secs_Epoc)/2], secs_Epoc[length(secs_Epoc)]), labels = c("Thu", "Fri", "Sat"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue") )#, lwd=c(2.5,2.5)))


dev.off()