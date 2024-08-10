## Correlation
cor(mtcars$mpg,mtcars$hp)
cor(mtcars$mpg,mtcars$wt)

plot(mtcars$wt, mtcars$mpg, pch=16)

cor(mtcars$mpg, mtcars[,c("hp","wt")])

cor(mtcars[,c("mpg", "hp","wt")])

# by pipe line 
library(dplyr) # to use 'select' function
mtcars %>% 
  select(mpg, hp, wt) %>%
  cor()

# compute correlation and significance test
cor(mtcars$mpg,mtcars$hp)
cor.test(mtcars$mpg,mtcars$hp)



## Linear Regression
# mpg = f(hp)
lmFit <- lm(mpg ~ hp, data = mtcars)

summary(lmFit)

# prediction if hp = 200
lmFit$coefficients[[1]] + lmFit$coefficients[[2]]*200

new_cars <- data.frame(
  hp = c(250, 320, 400, 410, 450)
)

# predict()
new_cars$mpg_pred <- predict(lmFit, newdata = new_cars)
new_cars$hp_pred <- NULL # delete column name hp_pred
new_cars

# can be observed that mpg_pred (when hp = 450) is negative value 
# because hp train data that we input into the model are in range of [52, 335]
# but test data hp = 450 is out of range 
summary(mtcars$hp) # let's explore.

## "Avoid using or validating our model with input data that falls outside the range of the training data."

## Root Mean Squared Error (RMSE)
## Multiple Linear Regression
## mpg = f(hp, wt, am)
## mpg = intercept + b0*hp + b1*wt + b2*am

lmFit_V2 <- lm(mpg ~ hp + wt + am, data = mtcars)
coefs <- coef(lmFit_V2)

coefs[[1]] + coefs[[2]]*200 + coefs[[3]]*3.5 + coefs[[4]]*1

# Build Full Model (mpg ~ all variables)
lmFit_Full <- lm(mpg ~ ., data = mtcars)
mtcars$predicted <- predict(lmFit_Full)

## Train RMSE
square_error <- (mtcars$mpg - mtcars$predicted)**2
rmse <- sqrt(mean(square_error))

### Start Full Procedure of Modelling
(data(mtcars))
## Split Data # Randomly Split
set.seed(36)
(n <- nrow(mtcars))
(id <- sample(1:n, size=n*0.8)) # indicates id of rows which are candidate of train data.
                              # sample space number = 1-36, pick 36*0.8 rows 
(train_data <- mtcars[c(id),])
(test_data <- mtcars[c(-id),]) # noted!! : index -id == choose all rows exclude rows which are in 'id' list
## Train Model
(model <- lm(mpg ~ hp + wt+ am, data = train_data))
(p_train <- predict(model))
  #(rmse <- sqrt(mean((train_data["mpg"]-p_train)**2))) #error เพราะ mean รับค่าเป็น vector
(rmse_train <- sqrt(mean((train_data[["mpg"]]-p_train)**2)))

## Test Model
(p_test <- predict(model, newdata=test_data))
(rmse_test <- sqrt(mean((test_data[["mpg"]]-p_test)**2)))

## Print Result
cat("RMSE Train", rmse_train,
    "\nRMSE Test", rmse_test)
cat("Our model is overfitting. (Good perform in train data but weak in test data")
