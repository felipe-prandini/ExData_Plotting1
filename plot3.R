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
png("plot3.png", width = 480, height = 480)

#write plot
with(s_data, plot(Datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", col = "black", type = "l"))
with(s_data, lines(Datetime, Sub_metering_2, col = "red", type = "l"))
with(s_data, lines(Datetime, Sub_metering_3, col = "blue", type = "l"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

#close plotting device
dev.off()
