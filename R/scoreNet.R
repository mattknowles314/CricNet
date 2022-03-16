scoreNet <- function(hiddenLayer, reps,alpha, trainData){
  scale(trainData)
  message("STARTING TRAINING")
  scoreNet <- neuralnet::neuralnet(formula, data=trainNorm, act.fct = "logistic", hidden = hiddenLayer, linear.output=T,rep = reps,
                        stepmax = 1e+12, learningrate=alpha, lifesign = "minimal",algorithm="rprop+",err.fct = "sse")
  message("TRAINING FINISHED")
  return(scoreNet)
}
