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
png("plot4.png", width = 480, height = 480)

#Set plotting device for 2 columns and 2 rows
par(mfrow = c(2,2))
#make first plot just the same as plot2.r
with(s_data, plot(Datetime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l"))

#make second plot
with(s_data, plot(Datetime, Voltage, xlab = "datetime", ylab = "Voltage", type = "l"))

#make third plot just as plot3.r but adding the bty = "n" to the legend function
with(s_data, plot(Datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", col = "black", type = "l"))
with(s_data, lines(Datetime, Sub_metering_2, col = "red", type = "l"))
with(s_data, lines(Datetime, Sub_metering_3, col = "blue", type = "l"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")

#make 4th plot
with(s_data, plot(Datetime, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l"))


#close plotting device
dev.off()
