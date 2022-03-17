#' Perform analysis on the neural network
#'
#' Uses corrolation to see how accurate the predictions of the neural network
#' were at predicting cricket scores. Produces a density plot of the errors
#' to see if they are normally distributed.
#' @return A corrolation and a density plot
#' @export
netAnalysis <- function(results){
  scoreCorr <- cor(results$actual,results$predicted)
  print(paste("Corrolation score",scoreCorr))
  message("Generating error distribution plot")
  ggplot2::ggplot(results, aes(x = error)) +
    ggplot2::geom_density()
}
