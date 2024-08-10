library(tidyverse)

## data visualization
## approach 1: base R visualization
## approach 2: ggplot => grammar of graphic (beautiful, useful tool)

## base R visualization
  #plot(mtcars$mpg, mtcars$hpm, pch=16, col="red")

  #boxplot(mtcars$mpg)  

  #t1 <- table(mtcars$am)
  #barplot(t1)

##ggplot (recommended)

# one variable, numeric
ggplot(data = mtcars, mapping = aes(x=mpg)) +
  geom_histogram(bins=9)

ggplot(data = mtcars, mapping = aes(x=mpg)) +
  geom_density()

ggplot(data = mtcars, mapping = aes(x=mpg)) +
  geom_freqpoly()

ggplot(mtcars,aes(mpg)) +
  geom_freqpoly()

p1 <- ggplot(mtcars,aes(hp)) +
  geom_histogram(bins=10)

mtcars %>% filter(hp<=200) %>% count()

## geom_col vs. geom_bar
# geom_col -> get input data as summary table
# geom_bat -> get input data as dataframe

# geom_col
mtcars %>% 
  mutate(am = ifelse(am==0,"Auto","Manual")) %>%
  count(am) %>%  # loading summary table (by am) to ggplot by pipeline
  ggplot(aes(am,n))+
  geom_col()

# geom_bar
mtcars %>% mutate(am = ifelse(am==0,"Auto","Manual")) -> mtcars_am
mtcars_am %>% ggplot(aes(am)) +
  geom_bar()


## two variables, numeric
## scatter plot
mtcars %>% ggplot(aes(hp, mpg)) +
  geom_point(col="blue", size=5)
