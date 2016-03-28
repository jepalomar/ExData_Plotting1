# SETTING THE WORKING DIRECTORY
setwd("D:\\Cursos\\Coursera\\DataScience\\ExploratoryDataAnalysis\\assignment1")
a<-read.table("household_power_consumption.txt",sep=";",header = TRUE,na.strings="?")
x<-paste(a$Date,a$Time)

# Convert to date
t<-strptime(x,"%d/%m/%Y %H:%M:%S")
# Add date clean date column
a$CleanDate<-t

# Define limit dates
date1<-strptime("01/02/2007","%d/%m/%Y")
date2<-strptime("03/02/2007","%d/%m/%Y")

# subset: get the data corresponding to the relevant dates
reduced<-subset(a,CleanDate>=date1 & CleanDate<date2)

#plot 
plot(reduced$CleanDate,reduced$Global_active_power, ylab="Global active power (kilowatts)",xlab="", type="l")

# export to png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()