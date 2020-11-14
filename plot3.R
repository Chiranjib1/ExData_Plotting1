#plot3 

filename <- "./data/household_power_consumption.txt"  #this time instead of promting the user to select the source file, I have decided to hard code it

my_data_orig <- read.table(filename, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

xdata <- as.POSIXlt(paste(my_data_orig$Date, my_data_orig$Time), format="%d/%m/%Y %H:%M:%S")

my_data <- mutate(my_data_orig, xdata)

my_data <- subset(my_data, Date %in%  c("1/2/2007", "2/2/2007"))

# str(my_data)

png(file= "./data/plot3.png", width = 480, height = 480)

with(my_data, {plot(xdata, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")})

with(my_data, {lines(my_data$xdata, my_data$Sub_metering_2, type="l", col="red")})

with(my_data, {lines(my_data$xdata, my_data$Sub_metering_3, type="l", col="blue")})



legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, col=c("black", "red", "blue"))

dev.off()
