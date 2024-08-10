library("caret")
library("tidyverse")

# caret = classification and regression tree

# train test split
# 1. split data 
# 2. train
# 3. score
# 4. evaluate

# explore dataset
glimpse(mtcars)

# 1. split data
train_test_split <- function(data, size) {
  set.seed(36)
  n <- nrow(data)
  train_id <- sample(1:n,size=n*size)
  train_data <- mtcars[train_id,]
  test_data <- mtcars[-train_id,]
  
  return(list(train=train_data, test=test_data))
}

split_data <- train_test_split(mtcars,0.8)
# 2. train model
lm_model <- train(mpg ~ hp+wt+am, data=split_data$train, method="lm")

# 3. score model
mpg_pred <- predict(lm_model, newdata = split_data$test)

# 4. evaluate model
  # MAE, MSE, RMSE
metric <- function(actual, prediction) {
  abs_error <- abs(actual - prediction)
  mae <- mean(abs_error)
  
  error <- actual - prediction
  mse <- mean(error**2)
  
  rmse <- sqrt(mean(error**2))
  
  return(list(MAE=mae, MSE=mse, RMSE=rmse))
}

metric(split_data$test$mpg, mpg_pred)

# 5. save model
saveRDS(lm_model, "linear_regression_v1.RDS")

# load model
model <- readRDS("linear_regression_v1.RDS")

# prediction from new data
new_cars <- data.frame(
  hp = c(150, 200, 250),
  wt = c(1.25, 2.2, 2.5),
  am = c(0, 1, 1)
)

new_cars$mpg_pred_new <- predict(model,newdata=new_cars)
new_cars
