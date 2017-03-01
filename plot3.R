plot3 <- function() {
  
  #Download and unzip data set if it does not already exist
  if(!file.exists("./household_power_consumption.txt")) {
    message("Downloading data...")
    download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./downloadedfile.zip", method="curl")
    unzip("./downloadedfile.zip")
  }
  
  #Loading data
  message("Loading data...")
  original_dataset<-read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  
  #Subsetting to 1/2/2007 - 2/2/2007
  feb_dataset<-original_dataset[original_dataset$Date=="1/2/2007"|original_dataset$Date=="2/2/2007",]
  
  #Creating a datetime column to represent date in x axis
  feb_dataset<-cbind(feb_dataset,datetime=strptime(paste(feb_dataset$Date,feb_dataset$Time),format="%d/%m/%Y %H:%M:%S"))
  
  #Plotting in png
  message("Plotting data...")
  png(filename = "plot3.png",
      width = 480, height = 480, units = "px", pointsize = 12,
      bg = "transparent")
  with(feb_dataset, plot(datetime, Sub_metering_1, type="l", xlab="",ylab="Energy sub metering"))
  lines(feb_dataset$datetime, feb_dataset$Sub_metering_2, type="l", col="red")
  lines(feb_dataset$datetime, feb_dataset$Sub_metering_3, type="l", col="blue")
  legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = c(1,1,1))
  invisible(dev.off())
}