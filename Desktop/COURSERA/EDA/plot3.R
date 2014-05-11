dat <- read.table("household_power_consumption.txt", sep=";", header=T)

subdat1 <- dat[dat$Date == "1/2/2007",]
subdat2 <- dat[dat$Date == "2/2/2007",]
exdat <- rbind(subdat1, subdat2)

e <- exdat$Date
t <- exdat$Time
p <- paste(e,t)
datetime <- as.POSIXct(strptime(p, "%d/%m/%Y %H:%M:%S"))
datetime <- as.POSIXct(strptime(p, "%d/%m/%Y %H:%M:%S"))
exdat$datetime <- datetime

with(exdat, {
  plot(datetime,Sub_metering_1, ylab="Energy sub metering", type="l")
  lines(datetime,Sub_metering_2, col="red")
lines(datetime,Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty =1, lwd =2,
        col = c("black", "red", "blue"))})
dev.copy(png, file="plot3.png")
dev.off()
