# plot2


my_data_orig <- read.delim(file.choose(), sep =";", na.strings ="?") # reading the source data file

xdata <- as.POSIXlt(paste(my_data_orig$Date, my_data_orig$Time), format="%d/%m/%Y %H:  %M:%S")  #converting the Date and Time to a time data type  to be used as x axis

my_data <- mutate(my_data_orig, xdata)  # add the x axis to the data frame

my_data <- subset(my_data, Date %in%  c("1/2/2007", "2/2/2007")) #subsetting data for 2 days

png(file= "./data/plot2.png", width = 480, height = 480)


with (my_data, {plot(xdata, Global_active_power, type ="l", xlab="", ylab ="")})

dev.off()
