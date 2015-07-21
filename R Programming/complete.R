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
    sub1 <- subset(mydata, !is.na(mydata$"sulfate"))
    sub1 <- subset(sub1, !is.na(sub1$"nitrate"))
    comtable <- rbind(comtable, data.frame("id" = i, "nobs" = nrow(sub1)))
  }
    print(comtable)
}
