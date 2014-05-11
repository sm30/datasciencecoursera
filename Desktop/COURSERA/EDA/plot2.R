dat <- read.table("household_power_consumption.txt", sep=";", header=T)

subdat1 <- dat[dat$Date == "1/2/2007",]
subdat2 <- dat[dat$Date == "2/2/2007",]
exdat <- rbind(subdat1, subdat2)

gap <- as.numeric(as.character(exdat$Global_active_power, drop=TRUE))

e <- exdat$Date
t <- exdat$Time
p <- paste(e,t)
datetime <- as.POSIXct(strptime(p, "%d/%m/%Y %H:%M:%S"))
datetime <- as.POSIXct(strptime(p, "%d/%m/%Y %H:%M:%S"))
exdat$datetime <- datetime
with(exdat, plot(datetime,gap, ylab="Global Active Power(kilowatts)", type="l"))
dev.copy(png, file="plot2.png")
dev.off()
