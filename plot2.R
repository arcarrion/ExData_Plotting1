plot2 <- function() {
  
  #Loading data
  original_dataset<-read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  
  #Subsetting to 1/2/2007 - 2/2/2007
  feb_dataset<-original_dataset[original_dataset$Date=="1/2/2007"|original_dataset$Date=="2/2/2007",]
  
  #Creating a datetime column to represent date in x axis
  feb_dataset<-cbind(feb_dataset,datetime=strptime(paste(feb_dataset$Date,feb_dataset$Time),format="%d/%m/%Y %H:%M:%S"))
  
  #Plotting in png
  png(filename = "plot2.png",
      width = 480, height = 480, units = "px", pointsize = 12,
      bg = "transparent")
  with(feb_dataset, plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
  dev.off()
}