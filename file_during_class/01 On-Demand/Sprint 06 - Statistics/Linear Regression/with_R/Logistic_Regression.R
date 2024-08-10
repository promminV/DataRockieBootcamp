## Logistic Regression

library(dplyr)
mtcars %>% head()

# We want to predict 'am' from other variables

str(mtcars)
mtcars$am <- factor(mtcars$am, 
                    levels = c(0,1),
                    labels = c("Auto","Manual"))
class(mtcars$am)
table(mtcars$am) # gen frequency table group by am

## split data
set.seed(36)
(n <- nrow(mtcars))
id <- sample(1:n, size=n*0.8)
train_data <- mtcars[id,]
test_data <- mtcars[-id,]

# train logistic model
logit_model <- glm(am ~ mpg, data = train_data, family="binomial") 
# x = mpg, y = am (logistic regression -> y in interval of [0,1] )
  # we know that if y >= 0.5 --> "am = Manual" because we indicate factor level '1' as manual (explore in line 10)
p_train <- predict(logit_model, type="response") # "response" = normalize value to probability (values fall in [0,1])
# interpret probability value with exact answer
(train_data$am_pred <- if_else(p_train >= 0.5, "Manual", "Auto"))
# validation
compared_train <- train_data$am == train_data$am_pred # recognize that TRUE = 0, FALSE = 1
  # so, we can calculate mean (== calculate sum of TRUE divided by #data)
train_result <- mean(compared_train)

# test model
p_test <- predict(logit_model, newdata = test_data ,type="response")
(test_data$am_pred <- if_else(p_test >= 0.5, "Manual", "Auto"))
compared_test <- test_data$am == test_data$am_pred
test_result <- mean(compared_test)

# print summary
cat("Train Accuracy", train_result*100,"%",
    "\nTest Accuracy", test_result*100,"%")
