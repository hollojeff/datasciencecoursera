corr <- function(directory, threshold = 0) {
  comp <- complete(directory)
  thresh <- subset(comp, nobs > threshold, select = id)
}
