#' Unscale a column of data
#'
#' Used for turning unscaled scores into actual cricket scores. Target refers to the
#' object that is to be unscaled, and original is the data that scale() was applied to
#' in the first place
#'
#' @return A column of data that is no longer scaled
#' @export
unscale <- function(target, original){
  scale_val = attr(original,"scaled:scale")[51]
  cent = attr(original, "scaled:center")[51]
  UNSCData <- c()
  for(i in 1:length(target)){
    UNSCData[i] <- target[i] * scale_val + cent
  }
  return(UNSCData)
}
