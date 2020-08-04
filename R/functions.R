# Get 95% confidence interval
get_ci <- function (x, ci = 0.95, ...) {
  a <- mean(x, ...)
  s <- sd(x, ...)
  n <- sum(!is.na(x))
  error <- qt(ci + (1 - ci)/2, df = n - 1) * s/sqrt(n)
  return(error)
}
