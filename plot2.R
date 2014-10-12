# Get sample data of file to guess column's classes
household_power_consumption_test <- read.csv("data/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, nrows = 5)
classes <- sapply(household_power_consumption_test, class)

#read the file
household_power_consumption_all <- read.table("data/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, colClasses =  classes, header = TRUE, na.strings = "?")

#subsetting dates
household_power_consumption <- household_power_consumption_all[household_power_consumption_all$Date == "1/2/2007" | household_power_consumption_all$Date == "2/2/2007",]

#convert Date and time variables
household_power_consumption$Time <- strptime(paste(household_power_consumption$Date,household_power_consumption$Time), "%d/%m/%Y %H:%M:%S")
household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")

# Building the graph
png(filename = "plot2.png")
par(mfrow = c(1,1))
plot(household_power_consumption$Time, household_power_consumption$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab="")


dev.off()
