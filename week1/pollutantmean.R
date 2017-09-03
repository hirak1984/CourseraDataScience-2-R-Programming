#Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the directory specified in the 'directory' argument and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA.

pollutantmean<-function(directory,pollutant,id=1:332){

  mean_vector<-c()
  for(i in id) {
    files<-sprintf("%03d.csv", i)
    all_data<-loadCSVs(directory=directory,files =files)
    na_removed <- all_data[!is.na(all_data[, pollutant]), pollutant]
    mean_vector <- c(mean_vector, na_removed)
  }
  mean(mean_vector,na.rm = T)

}
