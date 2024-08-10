install.packages("caret")
library("caret")

mtcars

train_test_split <- function(data) {
  set.seed(39)
  n <- nrow(data)
  id <- sample(n, size=0.8*n)
  train_data <- data[id,]
  test_data <- data[-id,]
  mylist <- list("train_data"=train_data, "test_data"=test_data)
  return(mylist)
  }

split_data <- train_test_split(mtcars)

# train model
lm_model <- train(mpg ~ hp, data = split_data[[1]], method = "lm")
  # rmse of train model included in lm_model

# score and evaluate
  # (self) calculate rmse of train model
  # !! this calculation can use only hold-out validation set.
  # Our train model uses bootstrap validation. (see RMSE in train() )
    #p_train <- predict(lm_model)
    #error_train <- split_data[[1]]$mpg - p_train
    #rmse_train <- sqrt(mean(error_train**2))

  # calculate rmse of test model
p_test <- predict(lm_model, newdata=split_data[[2]])
error_test <- split_data[[2]]$mpg - p_test 
rmse_test <- sqrt(mean(error_test**2))

