## Logistic Regression Example

happiness <- c(10, 8, 9, 7, 8, 5, 9, 6, 8, 7, 1, 1, 3, 1, 4, 5, 6, 3, 2, 0)

divorce <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)

df <- data.frame(happiness, divorce)

## Fit Logistic Regression Full Dataset
model <- glm(divorce ~ happiness, data = df, family = "binomial")

summary(model)

## Predict and Evaluate Model
df$prob_divorce <- predict(model, type="response")
df$pred_divorce <- ifelse(df$prob_divorce >= 0.5, 1, 0)

## confusion matrix
conf_mat <- table(df$pred_divorce, df$divorce, dnn = c("Predicted", "Actual"))

## model evaluation
acc <- (conf_mat[1,1] + conf_mat[2,2])/sum(conf_mat)
pre <- conf_mat[2,2] / (conf_mat[2,1] + conf_mat[2,2])
rec <- conf_mat[2,2] / sum(conf_mat[,2])
F1 <- 2*pre*rec/(pre+rec)

cat("Accuracy: ",acc,
    "\nPrecision: ",pre,
    "\nRecall:", rec,
    "\nF1 score: ",F1)
