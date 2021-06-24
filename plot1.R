homePower <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
homePower$Date <- format(as.Date(homePower$Date, format = "%d/%m/%Y"), "%m/%d/%Y")

globalPower <- homePower$Global_active_power[homePower$Date == "02/01/2007" | homePower$Date == "02/02/2007"]
png("plot1.png", width=480, height=480)
hist(as.numeric(globalPower), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()