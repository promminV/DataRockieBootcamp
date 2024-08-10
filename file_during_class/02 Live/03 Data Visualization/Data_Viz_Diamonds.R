library(tidyverse)
glimpse(diamonds)

diamonds %>% count(cut)

## ordinal factor (factor able to order)
temp <- c("high", "med", "low", "high")
temp <- factor(temp, levels = c("low", "med", "high"), ordered = T)

## factor
gender <- c("m", "f", "m")
gender <- factor(gender)

## frequency table
diamonds %>% count(cut, color, clarity)

## sample
set.seed(36)
diamonds %>% sample_n(5)

## sampling 10% of data
diamonds %>% sample_frac(0.1) 

## slice data 
diamonds %>% slice(58:70) 

## relationship (pattern)
  ggplot(diamonds %>% sample_n(500), aes(carat, price)) +
  geom_point() +
  geom_smooth() +
  geom_rug()

## setting vs, mapping
# setting  = set (customize) in geometric layer  --> set in geom
ggplot(diamonds, aes(price)) +
  geom_histogram(bins=100, fill="violetred1") #browse color name in R by function colors()
  
ggplot(diamonds%>%sample_n(500),aes(carat,price))+
  geom_point(size=5, alpha=0.2, color="red")

## mapping = set by referring to the other data column --> set in mapping
ggplot(diamonds%>%sample_n(500),aes(carat,price, col=cut))+
  geom_point(size=5, alpha=0.4) +
  theme_minimal()

## add label
ggplot(diamonds%>%sample_n(500),aes(carat,price, col=cut))+
  geom_point(size=5, alpha=0.4) +
  theme_minimal() +
  labs(
    title = "Reletionship between carat and price",
    x = "Carat",
    y = "Price USD",
    subtitle = "We found a positive relationship",
    caption = "Datasource: diamonds ggplot2"
  )

## customize palette color 
ggplot(diamonds%>%sample_n(500),aes(carat,price, col=cut))+
  geom_point(size=5, alpha=0.4) +
  theme_minimal() +
  labs(
    title = "Reletionship between carat and price",
    x = "Carat",
    y = "Price USD",
    subtitle = "We found a positive relationship",
    caption = "Datasource: diamonds ggplot2"
  ) +
  scale_color_manual(values= c(
    "red" , "green", "blue", "gold", "salmon"
  ))

ggplot(diamonds%>%sample_n(500),aes(carat,price, col=cut))+
  geom_point(size=5, alpha=0.5) +
  theme_minimal() +
  labs(
    title = "Reletionship between carat and price",
    x = "Carat",
    y = "Price USD",
    subtitle = "We found a positive relationship",
    caption = "Datasource: diamonds ggplot2"
  ) +
  scale_color_brewer(type="qual", palette = 3) # browse color in website colorbrewer 2.0


## map color scale (gradient color) -> mapping color to quantitative data
ggplot(mtcars, aes(hp, mpg, col=wt)) +
  geom_point(size=5, alpha=0.7) +
  theme_minimal() +
  scale_color_gradient(low="gold", high="red")

## facet = to split data in many segments, to observe the pattern of data clearly
ggplot(diamonds %>% sample_n(5000), aes(carat, price)) + 
  geom_point() +
  theme_minimal() +
  facet_wrap(~cut, ncol=1)+
  geom_smooth()

ggplot(diamonds %>% sample_n(30000), aes(carat, price)) +
  geom_point(alpha=0.3)+
  geom_smooth(col="red") +
  theme_minimal()+
  facet_grid()

## combine charts
library(patchwork)

p1 <- qplot(mpg, data=mtcars, geom="histogram", bins=10)
p2 <- qplot(hp, mpg, data=mtcars, geom="point")
p3 <- qplot(hp, data=mtcars, geom="density")

## quick plot
p1 + p2 + p3
(p1+p2) / p3

