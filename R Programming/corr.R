corr <- function(directory, threshold = 0) {
  comp <- complete(directory)
  thresh <- subset(comp, nobs > threshold, select = id)
  corrvec <- numeric()
  for(i in thresh[,1]){
    mydata <- read.csv(paste(directory,"/",i,".csv", sep=""))  # read csv file
    sub1 <- subset(mydata, !is.na(mydata$"sulfate"))
    sub1 <- subset(sub1, !is.na(sub1$"nitrate"))
    nitvec <- sub1[,"nitrate"]
    sulvec <- sub1[,"sulfate"]
    corrvec <- append(corrvec, cor(sulvec,nitvec))
  }
  return(corrvec)
}
