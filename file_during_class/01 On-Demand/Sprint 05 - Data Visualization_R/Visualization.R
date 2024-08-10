library(tidyverse)

## basic plots (base R)
hist(mtcars$mpg)

# Analyzing horse power
hist(mtcars$hp)
mean(mtcars$hp)
median(mtcars$hp)

str(mtcars)

# convert numeric data to factor data (data: am, am=0: Auto, am=1: Manual)
mtcars$am %>% factor(levels = c(0,1), 
                     labels = c("Auto", "Manual")) -> mtcars$am

# frequency table + bar plot : for one qualitative variable (เหมาะกับการใช้กับข้อมูลเชิงคุณภาพ ซึ่งมี 1 ตัวแปร)
am_f <- table(mtcars$am)
barplot(am_f)

## boxplot
boxplot(mtcars$hp)
# core five numbers of boxplot
# 1. minimum 2. 1st quuantilantile 3. median 4. 3rd qe 5. maximum (called outliers if there are extreme value)
fivenum(mtcars$hp)

min(mtcars$hp)
Q1 <- quantile(mtcars$hp, probs = 0.25)
median(mtcars$hp)
Q3 <- quantile(mtcars$hp, probs = 0.75)
max(mtcars$hp)

## whisker calculation (hands of the box)
IQR_hp <- Q3-Q1
top_hand <- Q3 + 1.5*IQR_hp
bottom_hand <- Q1- 1.5*IQR_hp # if result as negative value, minimum value is used instead.

# boxplot describes 4 details -> 1. five numbers 2. observation numbers 3.???  4. outliers
boxplot.stats(mtcars$hp, coef=1.5)

# filter out outliers
mtcars %>% filter(hp < 335) -> mtcars_noout

boxplot.stats(mtcars_noout$hp, coef=1.5)
boxplot(mtcars_noout$hp) # then, we get the data with no outliers !

## boxplot can be used with 2 variables 
 # one is qualitative (คุณภาพ) variable, the other is quantitative variable
# example mtcars -> am: qualitative = "auto", "manual" / mpg: quantitative (miles per gallon)
data(mtcars)
mtcars$am <- factor(mtcars$am, 
                    levels = c(0,1),
                    label = c("Auto", "Manual"))
boxplot(mpg~am, data = mtcars,
        col = c("lightblue", "pink")) # quantitative (y-axis) ~ qualitative (x-axis)

## scatter plot
  # use for 2 quantitative variables
plot(mtcars$hp, mtcars$mpg, pch=16, col="blue",
     main = "Relationship between HP and MPG",
     xlab = "Horse Power",
     ylab = "Miles per Gallon") # pch = marker symbol
cor(mtcars$hp, mtcars$mpg) # correlation < 0 (because of relation between x and y : x increase, y decrease -> corr (-) )
# fitting linear model 
lm(mpg~hp, data=mtcars) # slope_graph < 0

