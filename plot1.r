Target <- read.csv2("household_power_consumption.txt",
                    header = TRUE, sep = ";", na.strings = "?")

Initial_date <-strptime("01/02/2007", "%d/%m/%Y")
Final_Date   <-strptime("02/02/2007", "%d/%m/%Y")

DatesList <- strptime(Target[,1], "%d/%m/%Y")
IsDaterelevant <- Initial_date <= DatesList & Final_Date >= DatesList
RelevantData <- Target[IsDaterelevant,]
png(filename = "./plot1.png",width = 480,height = 480) 
hist(as.numeric(as.character(RelevantData[,3])),
     col = "RED",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()