pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  totalmean = vector()
  for (i in id){
    if (i < 10){
      i <- paste("00", i, sep="")
    }
    else if (i > 9 && i < 100){
      i <- paste("0", i, sep="")
    }
    mydata = read.csv(paste(directory,"/",i,".csv", sep=""))  # read csv file
    totalmean <- c(totalmean, mydata[[pollutant]])
  }
 mean(totalmean, na.rm = TRUE)
}
