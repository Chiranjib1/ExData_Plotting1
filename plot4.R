#plot4

filename <- "./data/household_power_consumption.txt"  

my_data_orig <- read.table(filename, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

xdata <- as.POSIXlt(paste(my_data_orig$Date, my_data_orig$Time), format="%d/%m/%Y %H:%M:%S")

my_data <- mutate(my_data_orig, xdata)

my_data <- subset(my_data, Date %in%  c("1/2/2007", "2/2/2007"))

# str(my_data)

png(file= "./data/plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

# first graph
with(my_data, {plot(xdata, Global_active_power, type="l", xlab="", ylab="Global Active Power")})

# second graph
with(my_data, {plot(xdata, Voltage, type="l", xlab="", ylab="Global Active Power")})

# third graph

with(my_data, {plot(xdata, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")})

with(my_data, {lines(my_data$xdata, my_data$Sub_metering_2, type="l", col="red")})

with(my_data, {lines(my_data$xdata, my_data$Sub_metering_3, type="l", col="blue")})

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, col=c("black", "red", "blue"))

# fourth graph
with(my_data, {plot(xdata, Global_reactive_power, type="l", xlab="", ylab="Global_reactive_power")})





dev.off()
