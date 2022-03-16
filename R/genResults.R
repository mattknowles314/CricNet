#' Use scorenet network to predict scores
#'
#' First this selects the best rep of the nn object passed to the function.
#' It then uses this specific network on a set of test data to predict the
#' score in a game of cricket. The actual score should be in the 51st column of the test data,
#' the prior columns being the runrates for the corresponding over.
#' The function then returns the dataframe of results
#' @return A data frame containing unscaled true game scores, predicted game scores and the error
genResults <- function(network,testData){
  best_rep = which.min(network$result.matrix[1,])
  predictVals <- neuralnet::compute(network,scale(testData[,1:50]),rep=best_rep)
  testNorm <- scale(testData)
  results <- data.frame(actual=testNorm$V51, predicted=predictVals$V51)
  results$error <- (results$actual-results$predicted)
  return(results)
}
