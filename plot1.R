plot1 <- function() {

  #Loading data
  original_dataset<-read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  
  #Subsetting to 1/2/2007 - 2/2/2007
  feb_dataset<-original_dataset[original_dataset$Date=="1/2/2007"|original_dataset$Date=="2/2/2007",]

  #Plotting in png
  png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "transparent")
  with(feb_dataset, hist(x=Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)"))
  dev.off()
}