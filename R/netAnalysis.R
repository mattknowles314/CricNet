netAnalysis <- function(results){
  scoreCorr <- cor(results$actual,results$predicted)
  print(paste("Corrolation score",scoreCorr))
  message("Generating error distribution plot")
  ggplot2::ggplot(results, aes(x = error)) +
    ggplot2::geom_density()
}
