# Read file
wdir<- "C:\\Documents and Settings\\Rafael\\Desktop\\Exploratory Data Analysis"
setwd(wdir)
file <- read.table("household_power_consumption.txt",sep = ";", header = T)

# Convert data and getting the subset
file$Date<-as.character(file$Date)
subset<-file[file$Date=="1/2/2007",  ]
subset<-rbind(subset,file[file$Date=="2/2/2007",  ])
# Formatting the subset
subset$Date<-as.Date(subset$Date,format="%d/%m/%Y",origin="01/01/1970")
subset$Time<-as.character(subset$Time)
subset$Global_active_power<-as.character(subset$Global_active_power)
subset$Global_reactive_power<-as.character(subset$Global_reactive_power)
subset$Voltage<-as.character(subset$Voltage)
subset$Global_intensity<-as.character(subset$Global_intensity)
subset$Sub_metering_1<-as.character(subset$Sub_metering_1)
subset$Sub_metering_2<-as.character(subset$Sub_metering_2)

#
# graph 1: histogram of GAP
#

# Cleaning data
subset2<-subset[subset$Global_active_power!= "?",]
# Save to a PNG file
png("plot1.png")
hist(as.numeric(subset2$Global_active_power), breaks=14, col="red",xlab="Global Active Power (kilowatts)",main="")
title("Global Active Power")
dev.off()
