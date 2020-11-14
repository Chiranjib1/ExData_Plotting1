# plot 1

my_data_orig <- read.delim(file.choose(), sep =";", na.strings ="?")   # read the data. You have to select the source file at prompt

#str(my_data_orig)

my_data_orig$Date <- as.Date(my_data_orig$Date, "%d/%m/%Y")  #converting the date but later realized that it's not required for this plot

my_data <- subset(my_data_orig, Date == as.Date("2007/02/02") | Date == as.Date("2007/02/01")) # subsetting the data for 2 days

# str(my_data)


png(file= "./data/plot1.png", width = 480, height = 480)   #initialize a png file
hist(my_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")   # draw the histogram
dev.off()   # turn the png device off


