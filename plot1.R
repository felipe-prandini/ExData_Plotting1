#Set this command for your working directory
setwd("/Volumes/GoogleDrive/My Drive/JohnHopkinsDataScience/datasciencecoursera/exploratory_data_analysis/assignment1")

#Download and unzip the exercise files
path <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(path, destfile = "data.zip", method = "curl")
unzip(zipfile = "data.zip", exdir = getwd())

#load main data into R
data <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?", dec = ".")

#convert date and time using strptime
data$Datetime <- paste(data$Date, " ", data$Time)
data$Datetime <- strptime(data$Datetime, format = "%d/%m/%Y %H:%M:%S")

#subset for the data of interest
s_data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))


#open png plot device
png("plot1.png", width = 480, height = 480)

#write plot
hist(s_data$Global_active_power, col = "red", main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)")

#close plotting device
dev.off()
