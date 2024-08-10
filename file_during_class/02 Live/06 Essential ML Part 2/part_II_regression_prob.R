# mlbench rpart randonForest class glmnet

install.packages("mlbench")

library("mlbench")
library("caret")
library("tidyverse")

# see available datasets 
data()
data("BostonHousing")
df <- BostonHousing

## glimpse data
glimpse(df)

## clustering => segmentation = find pattern in feature, no label data (unsupervised learning)
  # use k-means
subset_df <- df %>% 
  select(crim, rm, age, lstat, medv) %>%
  as_tibble()


## test different k (k = 2-5)
result <- kmeans(x=subset_df, centers=3)

## membership [1, 2, 3]
subset_df$cluster <- result$cluster

##-----------------------------------------------------------------------------------------------------

## built model lm, knn
  # (knn can use both regression and classification problem)
  # (concept for knn in regression: 
  #   1. match data point into optimized cluster (with specified #k groups)
  #   2. predicted value of data-point within the same cluster are similar.)

# 1. split
set.seed(42)
n <- nrow(df)
id <- sample(1:n, size=n*0.8)
train_data <- df[id,]
test_data <- df[-id,]
# 2. train model 
set.seed(42) # set seed because bootstrap algo. is randomly duplicating train data.
lm_model <- train(medv ~ crim + rm + age, data=train_data, method="lm")
knn_model <- train(medv ~ crim + rm + age, data=train_data, method="knn")

  # as you can see, result from KNN is worse than Regression.
  # Pre-process => standardization/normalization to scale the feature is very important process. !!!!!!
    # due to feature scaling,that scales the feature data into smaller value, 
    # it help algorithm can find optimal solution easier.
set.seed(42)


lm_model <- train(medv ~ crim + rm + age, data=train_data, method="lm",
                  metric = "Rsquared",
                  preProcess = c("center", "scale"))
knn_model <- train(medv ~ crim + rm + age, data=train_data, method="knn",
                   metric = "Rsquared",
                   preProcess = c("center", "scale"))

# 3. score 
p_knn <- predict(knn_model, newdata=test_data)
p_lm <- predict(lm_model, newdata=test_data)

# 4. evaluate
RMSE(p_knn, test_data$medv)
RMSE(p_lm, test_data$medv)
##-----------------------------------------------------------------------------------------------------

## knn with cross-validation + grid search

ctrl <- trainControl(method="cv", number=5, verboseIter = TRUE)

# hyperparameters tuning
  # grid search (to custom k value to train model) 
k_grid  <- data.frame(k = c(3,5,7,9,11))

knn_model <- train(medv ~ crim + rm + age, data=train_data, method="knn",
                   metric = "Rsquared",
                   tuneGrid = k_grid,
                   preProcess = c("center", "scale"),
                   trControl = ctrl)

  # random search (define # number of k to search) => tuneLength
knn_model <- train(medv ~ crim + rm + age, data=train_data, method="knn",
                   metric = "Rsquared",
                   tuneLength=5,
                   preProcess = c("center", "scale"),
                   trControl = ctrl)

