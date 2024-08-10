library("mlbench")
library("caret")
library("tidyverse")

# KNN model

data("PimaIndiansDiabetes")
df <- PimaIndiansDiabetes
df <- as_tibble(df)

# !! very important -> 
# clarify that factor level of positive class is at level 0 (top level).
# if not, need to change factor level
df$diabetes <- relevel(df$diabetes, "pos")
# because knn train() will use factor level 0 as positive class (default setting and cannot customize)

## 1. split data
n = nrow(subset_df)
set.seed(42)
train_id <- sample(1:n, n*0.8)
train_data <- df[train_id,]
test_data <- df[-train_id,]

## 2. train data
library("MLmetrics")

ctrl <- trainControl(method="cv", 
                     number=5, 
                     verboseIter = TRUE,
                     summaryFunction = prSummary, # เพื่อ report evaluation เป็น precision, recall
                     classProbs = TRUE)

  
knn_model <- train(diabetes~., 
                   data=train_data, 
                   method="knn",
                   tuneLength = 5,
                   preProcess = c("center", "scale"),
                   metric = "Recall", # ลองเปลียนให้หา optimal solution by precision, recall, AUC แล้วดูว่าได้  k เท่าไหร่บ้าง
                   trControl = ctrl) 

## 3. score data
diabetes_pred <- predict(knn_model, newdata=test_data)
test_data$pred <- diabetes_pred

## 4. evaluate data
 # manual 
  table(test_data$diabetes, diabetes_pred, dnn=c("Actual", "Prediction"))
  
 # by function
  confusionMatrix(diabetes_pred, 
                  test_data$diabetes, 
                  positive="pos",
                  mode = "prec_recall")
  
  
# train (focus on accuracy)
  ctrl <- trainControl(method="cv", 
                       number=5, 
                       verboseIter = TRUE)
  
  
  knn_model <- train(diabetes~., 
                     data=train_data, 
                     method="knn",
                     tuneLength = 5,
                     preProcess = c("center", "scale"),
                     metric = "Accuracy", # ลองเปลียนให้หา optimal solution by precision, recall, AUC แล้วดูว่าได้  k เท่าไหร่บ้าง
                     trControl = ctrl) 
  
  ##----------------------------------------------------------------------------------------------------------
  
  ## logistic regression model
  ctrl <- trainControl(method="cv", 
                       number=5, 
                       verboseIter = TRUE)
  
  glm <- train(diabetes~., 
                     data=train_data, 
                     method="glm",
                     tuneLength = 5,
                     preProcess = c("center", "scale"),
                     metric="Accuracy",
                     trControl = ctrl) 
  ##----------------------------------------------------------------------------------------------------------
  ## Decision Tree (rpart)
  ctrl <- trainControl(method="cv", 
                       number=5, 
                       verboseIter = TRUE)
  
  tree_model <- train(diabetes~., 
               data=train_data, 
               method="rpart",
               metric="Accuracy",
               tuneLength = 5,
               preProcess = c("center", "scale"),
               trControl = ctrl) 
library(rpart)
library(rpart.plot)
rpart.plot(tree_model$finalModel)  
##----------------------------------------------------------------------------------------------------------
## Random Forest
  # The algorithms that using bootstrap resampling technique (repeated sampling in train data)
  # and random sampling in features selection

## mtry = number of features selection to train model
  # ex.mtry = 3 -> randomly select 3 features to train model 
  # train for all possibility for using 3 features (randomly plant the trees) and then keep the result from all trees
  # in this case : result = diabetes or not diabetes
  # summarize final result by majority vote => ex. 10 of 14 trees told "diabetes" -> summarize .. predict = diabetes


mtry_grid <- data.frame(mtry=2:8)

rf_model <- train(diabetes~., 
                    data=train_data, 
                    method="rf",
                    metric="Accuracy",
                    tuneGrid=mtry_grid,
                    tuneLength = 5,
                    preProcess = c("center", "scale"),
                    trControl = ctrl) 
##----------------------------------------------------------------------------------------------------------
 
## Compare all models together (in accuracy)
list_models <- list(knn=knn_model, 
                    logistic=glm,
                    decisionTree=tree_model,
                    randomForest=rf_model)

results <- resamples(list_models)

summary(results)

dotplot(results) #plot all model performance to compare
##----------------------------------------------------------------------------------------------------------

## Ridge vs. Lasso Regression
library(glmnet)

# 0=Ridge , 1=Lasso
glmnet_grid <- expand.grid(alpha=0:1,
                           lambda=c(0.1,0.2,0.3)) 
  # use expand for combination alpha x lambda

glmnet_model <- train(diabetes~., 
                  data=train_data, 
                  method="glmnet",
                  metric="Accuracy",
                  tuneGrid=glmnet_grid,
                  preProcess = c("center", "scale"),
                  trControl = ctrl) 

##----------------------------------------------------------------------------------------------------------

####### Experimentation is at the heart of the Machine Learning profession.
# ไม่มีทางอื่นนอกจากทดลองไปเยอะ ๆ เปรียบเทียบผลของแต่ละโมเดล -> เลือกอันที่นำไปใช้ได้ง่ายที่สุด