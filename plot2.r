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

png(filename = "./plot2.png",width = 480,height = 480) 


plot(x = secs_Epoc,y = as.numeric(as.character(RelevantData[,3])),type = "l",xaxt = 'n', xlab="", ylab = "Global Active Power (kilowatts)")
axis(1,at = c(secs_Epoc[1], secs_Epoc[length(secs_Epoc)/2], secs_Epoc[length(secs_Epoc)]), labels = c("Thu", "Fri", "Sat"))
     

dev.off()