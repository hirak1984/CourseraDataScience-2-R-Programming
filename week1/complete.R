#Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases

complete<-function(directory,id=1:332){
  f<-sprintf("%03d.csv", id[1])
  all_data<-loadCSVs(directory=directory,files=f)
  valid_data<-na.omit(all_data)
  #First create data frame from the first file
  retVal<-data.frame(id[1],nrow(valid_data))
  colnames(retVal) <- c("id","nobs")
  #Now loop through the rest of the files and rbind. Skip the first file because already added
  for(i in id){
    if(i==id[1]){next}
    f<-sprintf("%03d.csv", i)
    ad<-loadCSVs(directory=directory,files=f)
    vd<-na.omit(ad)
    rv<-data.frame(i,nrow(vd))
    colnames(rv) <- c("id","nobs")
    retVal<-rbind(retVal,rv)
  }
  retVal
}
