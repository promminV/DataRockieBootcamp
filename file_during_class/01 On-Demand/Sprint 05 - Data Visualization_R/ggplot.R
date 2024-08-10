## ggplot2
## library tidyverse
library(tidyverse)

## First plot
ggplot(data = mtcars, mapping = aes(x = hp, y = mpg)) +
  geom_point() + 
  geom_smooth() +
  geom_rug()

# layer 1 ggplot = datasets, 
# layer 2 mapping = x, y
# layer 3 geographic = geom_point, geom_smooth, ...

# short - term
ggplot(mtcars, aes(hp, mpg)) +
  geom_point(size=3, col="blue", alpha=0.2) # 0<alpha<1 = opacity
# histogram -> for exploring frequency
ggplot(mtcars,aes(hp)) +
  geom_histogram(bins=25, fill="red", alpha=0.5) # default bin = 30, setting appropriate bin value should be concerned.
  # เลือก bin ที่เห็น pattern ของข้อมูลดี

p <- ggplot(mtcars, aes(hp))
p + geom_histogram(bins = 10)
p + geom_density()
p + geom_boxplot()

## bar plot by group
  # review : bar plot good for visualizing
    # relationship between qualitative (factor) data to quantitative data

# explore cut type (count by cut)
diamonds %>% count(cut)
ggplot(diamonds, aes(cut)) + 
  geom_bar()

# explore colors of diamond in each cut
diamonds %>% count(cut)
ggplot(diamonds, mapping = aes(cut, fill=color)) + 
  geom_bar()
  # the result bar is in 'stack' position (default position)

# separate the stack bars ->the result bar is in 'dodge' position
diamonds %>% count(cut)
ggplot(diamonds, mapping = aes(cut, fill=color)) + 
  geom_bar(position = 'dodge')

# proportion position (visualize as percent)
diamonds %>% count(cut)
ggplot(diamonds, mapping = aes(cut, fill=color)) + 
  geom_bar(position = 'fill')

## explore relationship between carat and price -> 'scatter plot'

ggplot(diamonds, aes(carat, price)) +
  geom_point()
  # because of very large data -> sample data for reduce time of operation
set.seed(99) # lock sampling result
small_diamonds <- sample_n(diamonds, 5000)

## FACET concept: small multiples
  #  analyze relationship between carat and price deeper 
  #  ex . varying color conditions
ggplot(small_diamonds, aes(carat, price)) +
  geom_point() +
  geom_smooth(method = "lm") +
  facet_wrap(~color, ncol=4) # facet by color

  # may be used for validation of sample data 
  # or used for searching new aspect to our data
  
## Final Example
ggplot(small_diamonds, aes(carat, price)) +
  geom_point(size=3, alpha=0.2) + 
  facet_wrap(~ color, ncol=2) +
  theme_minimal()

