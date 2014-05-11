dat <- read.table("household_power_consumption.txt", sep=";", header=T)

subdat1 <- dat[dat$Date == "1/2/2007",]
subdat2 <- dat[dat$Date == "2/2/2007",]
exdat <- rbind(subdat1, subdat2)

gap <- as.numeric(as.character(exdat$Global_active_power, drop=TRUE))
hist(gap, xlab = "Global Active Power(kilowatts)",
     ylab = "Frequency", main = "Global Active Power" , col = "red")
dev.copy(png, file="plot1.png")
dev.off()