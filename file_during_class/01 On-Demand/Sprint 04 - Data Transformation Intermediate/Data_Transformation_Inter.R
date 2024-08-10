## Data Transformation (Intermediate)
install.packages("tidyverse") # dplyr included and more libraries
library("tidyverse")
## data.frame vs. tribble
df_tibble <- tibble(id = 1:3, name = c("toy", "jisoo", "lisa"))

df_normal <- data.frame(df_tibble) #convert from tibble to dataframe (normal)

df_tibble1 <- tibble(df_normal) #convert from dataframe to tibble

# sample_n
mtcars #built-in datasets
sample_n(mtcars, size = 5)

#run seed + sample_n in one time for freezing sample data
set.seed(25)
sample_n(mtcars, size = 5)

# sample percentage of data
sample_frac(mtcars, size = 0.2) # sampling 20% of data

# sampling data repeatly
sample_n(mtcars, size = 20, replace = T)

# slice data
mtcars %>% 
  slice(1:5)  # result same as mtcars[1:5,]

mtcars %>% 
  slice(6:10)

mtcars %>% 
  slice(c(1,3,5))

mtcars %>% 
  slice(6:10)

mtcars %>%
    slice(sample(nrow(mtcars),10))

#Additional Note
tibble(mtcars) #row names ignored
tibble(name = rownames(mtcars), mtcars) #bring row names back after converting


