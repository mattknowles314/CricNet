genResults <- function(network,testData){
  best_rep = which.min(network$result.matrix[1,])
  predictVals <- neuralnet::compute(network,scale(testData[,1:50]),rep=best_rep)
  testNorm <- scale(testData)
  results <- data.frame(actual=testNorm$V51, predicted=predictVals$V51)
  results$error <- (results$actual-results$predicted)
}
