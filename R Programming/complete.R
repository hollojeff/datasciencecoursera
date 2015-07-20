complete <- function(directory, id = 1:332) {
  
  comtable <- data.frame(id = NULL, nobs = NULL)
  for (i in id){
    if (i < 10){
      i <- paste("00", i, sep="")
    }
    else if (i > 9 && i < 100){
      i <- paste("0", i, sep="")
    }
    mydata <- read.csv(paste(directory,"/",i,".csv", sep=""))  # read csv file
    nobs <- 0
    for(row in 1:nrow(mydata)){
      if(is.na(mydata[row, "sulfates"]) !=0){
        nobs <- nobs + 1
      }
    }
    comtable <- rbind(comtable, data.frame(x = id, y = nobs))
  }
  comtable
}