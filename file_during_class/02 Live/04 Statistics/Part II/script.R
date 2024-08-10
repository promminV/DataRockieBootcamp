# Z-Score (Standardization)

z_calculation <- function(x) {
  (x-mean(x)) / sd(x)
}

z_calculation(c(1,2,3,4,5))

z_calculation(mtcars$hp)              

## (min-max) normalization or "feature scaling"
  # 0-1

norm_cal <- function(x) {
  (x-min(x)) / (max(x)-min(x))
}

norm_cal(1:5)
norm_cal(mtcars$hp)

## confidence interval for hp
  # !!! sd() in Rstudio is for sample only
  # if sd for population is needed, we will need to create our function.

sd_pop <- function(x) {
  sqrt(sum((x-mean(x))**2) / length(x))
}

sd_pop(mtcars$hp)
sd(mtcars$hp)

# t.test() to get confidence interval (and others) easily
t.test(mtcars$hp)


