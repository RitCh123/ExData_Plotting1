homePower <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
homePower$Date <- format(as.Date(homePower$Date, format = "%d/%m/%Y"), "%m/%d/%Y")

#generated the first column, first plot

png("plot4.png", width=480, height=480)
par(mfcol = c(2,2), mar = c(4,4,2,2))

globalPower <- homePower$Global_active_power[homePower$Date == "02/01/2007" | homePower$Date == "02/02/2007"]
weekday <- weekdays(as.Date(homePower$Date[homePower$Date == "02/01/2007" | homePower$Date == "02/02/2007"], format = "%m/%d/%Y"))
#the match statement gives the first instance of the value "FRIDAY"
#since the weekday vector and the globalPower vector are in the same order
#the day of friday is marked at the index of where Friday begins
v1 <- c(0, match("Friday", weekday), length(weekday))
#labelling the days of the week
labels <- c(weekdays(as.Date("02/01/2007", format = "%m/%d/%Y"), abbreviate = TRUE), weekdays(as.Date("02/01/2007", format = "%m/%d/%Y") + 1, abbreviate = TRUE),  weekdays(as.Date("02/01/2007", format = "%m/%d/%Y") + 2, abbreviate = TRUE))
plot(globalPower, type="l", xaxt="n", ylab = "Global Active Power", xlab = "")
axis(side = 1,
     at = v1,
     labels=labels)

#generated the first column, second plot
subOne <- homePower$Sub_metering_1[homePower$Date == "02/01/2007" | homePower$Date == "02/02/2007"]
subTwo <- homePower$Sub_metering_2[homePower$Date == "02/01/2007" | homePower$Date == "02/02/2007"]
subThree <- homePower$Sub_metering_3[homePower$Date == "02/01/2007" | homePower$Date == "02/02/2007"]


plot(subOne, type="l", xaxt = "n", col = "black", xlab = "", ylab = "Energy sub metering",
     ylim = range(as.numeric(subOne)))

lines(subTwo, col = "red")

lines(subThree, col = "blue")

#created custom tick marks
v1 <- c(0, match("Friday", weekday), length(weekday))

labels <- c(weekdays(as.Date("02/01/2007", format = "%m/%d/%Y"), abbreviate = TRUE), weekdays(as.Date("02/01/2007", format = "%m/%d/%Y") + 1, abbreviate = TRUE),  weekdays(as.Date("02/01/2007", format = "%m/%d/%Y") + 2, abbreviate = TRUE))

axis(side = 1,
     at = v1,
     labels=labels)

#add a legend

legend("topright", legend=names(homePower)[7:9], lty = c(1,1,1), col = c("black", "red", "blue"), cex = 0.65, pt.cex = 1, box.lwd = 0)

#generating second row, first plot

voltage <- homePower$Voltage[homePower$Date == "02/01/2007" | homePower$Date == "02/02/2007"]

plot(voltage, type="l", xaxt = "n", xlab = "datetime", ylab = "Voltage")

axis(side = 1,
     at = v1,
     labels=labels)

#generating second row, second plot

reactPower <- homePower$Global_reactive_power[homePower$Date == "02/01/2007" | homePower$Date == "02/02/2007"]

plot(reactPower, type="l", xaxt = "n", xlab = "datetime", ylab = "Global_reactive_power")

axis(side = 1,
     at = v1,
     labels=labels)
dev.off()