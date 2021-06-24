homePower <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
homePower$Date <- format(as.Date(homePower$Date, format = "%d/%m/%Y"), "%m/%d/%Y")
#initalizing variables
subOne <- homePower$Sub_metering_1[homePower$Date == "02/01/2007" | homePower$Date == "02/02/2007"]
subTwo <- homePower$Sub_metering_2[homePower$Date == "02/01/2007" | homePower$Date == "02/02/2007"]
subThree <- homePower$Sub_metering_3[homePower$Date == "02/01/2007" | homePower$Date == "02/02/2007"]

weekday <- weekdays(as.Date(homePower$Date[homePower$Date == "02/01/2007" | homePower$Date == "02/02/2007"], format = "%m/%d/%Y"))
#plotting

plot(subOne, type="l", xaxt = "n", col = "black", xlab = "", ylab = "Energy sub metering")

lines(subTwo, col = "red")

lines(subThree, col = "blue")

#created custom tick marks
v1 <- c(0, match("Friday", weekday), length(weekday))

labels <- c(weekdays(as.Date("02/01/2007", format = "%m/%d/%Y"), abbreviate = TRUE), weekdays(as.Date("02/01/2007", format = "%m/%d/%Y") + 1, abbreviate = TRUE),  weekdays(as.Date("02/01/2007", format = "%m/%d/%Y") + 2, abbreviate = TRUE))

axis(side = 1,
     at = v1,
     labels=labels)

#add a legend

legend("topright", legend=names(homePower)[7:9], lty = c(1,1,1), col = c("black", "red", "blue"))

