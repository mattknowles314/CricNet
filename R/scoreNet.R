#' Train a neural network
#'
#' This function trains a neural network based on runrate data from a 50 over innings.
#' The parameters of the network are passed to the function which essentially acts as a wrapper
#' on the neuralnet package.
#'
#'@return Am object of class nn.
#'@seealso [neuralnet::neuralnet()] which this function acts as a wrapper for
#'@examples
#'scoreNet(c(10,5,3),1000,0.01,formula)
scoreNet <- function(hiddenLayer, reps,alpha, trainData,formula){
  if(is.null(formula)){
    message("No Formula Given")
    return("Failed: No Formula")
  }
  scale(trainData)
  message("STARTING TRAINING")
  scoreNet <- neuralnet::neuralnet(formula, data=trainNorm, act.fct = "logistic", hidden = hiddenLayer, linear.output=T,rep = reps,
                        stepmax = 1e+12, learningrate=alpha, lifesign = "minimal",algorithm="rprop+",err.fct = "sse")
  message("TRAINING FINISHED")
  return(scoreNet)
}
