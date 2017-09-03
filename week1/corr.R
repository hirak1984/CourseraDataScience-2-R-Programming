#Write a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function should return a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0

corr<-function(directory,threshold=0){
  data<-complete(directory = directory)
  newdata <- subset(data, nobs > threshold)
  ids_above_threshold<-newdata[["id"]]
  llen<-length(ids_above_threshold)
  #initialize the return vector
  cr <- c()
  if(llen>0){
  #for each eligible ids
  for(i in 1:llen){
    f<-sprintf("%03d.csv", ids_above_threshold[i])
    #load the file
    all_data<-loadCSVs(directory=directory,files=f)
    vd<-na.omit(all_data)
    cr <- c(cr, cor(vd$sulfate, vd$nitrate) )
  }
}
  #return vector cr
  (cr)
}
