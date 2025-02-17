homePower <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
homePower$Date <- format(as.Date(homePower$Date, format = "%d/%m/%Y"), "%m/%d/%Y")

globalPower <- homePower$Global_active_power[homePower$Date == "02/01/2007" | homePower$Date == "02/02/2007"]
weekday <- weekdays(as.Date(homePower$Date[homePower$Date == "02/01/2007" | homePower$Date == "02/02/2007"], format = "%m/%d/%Y"))
#the match statement gives the first instance of the value "FRIDAY"
#since the weekday vector and the globalPower vector are in the same order
#the day of friday is marked at the index of where Friday begins
v1 <- c(0, match("Friday", weekday), length(weekday))
#labelling the days of the week
labels <- c(weekdays(as.Date("02/01/2007", format = "%m/%d/%Y"), abbreviate = TRUE), weekdays(as.Date("02/01/2007", format = "%m/%d/%Y") + 1, abbreviate = TRUE),  weekdays(as.Date("02/01/2007", format = "%m/%d/%Y") + 2, abbreviate = TRUE))
png("plot2.png", width=480, height=480)
plot(globalPower, type="l", xaxt="n", ylab = "Global Active Power (kilowatts)", xlab = "")
axis(side = 1,
     at = v1,
     labels=labels)
dev.off()