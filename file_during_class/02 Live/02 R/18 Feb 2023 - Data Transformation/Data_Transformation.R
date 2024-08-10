install.packages("tidyverse")
install.packages("glue")

library("tidyverse")
library("glue")
library("sqldf")

# explore dataframe
glimpse(mtcars)

head(mtcars,3)
tail(mtcars,2)

# sql
# run sql query with R
sqldf(
  "select * from mtcars where mpg>30"
)

df <- sqldf(
  "select * from mtcars where wt<30"
)

sqldf("select am, avg(mpg), sum(mpg) from mtcars group by am")

# glue
my_name <- "kong"
my_age <- 23

glue("Hello my name is {my_name}. I'm {my_age} years old.")
# using glue to input variable object in string / better than using paste()

# tidyverse 
# dplyr => data transformation
# 1. select
# 2. filter
# 3. mutate
# 4. arrange
# 5. summarize + group by

# select column
glimpse(mtcars)

select(mtcars, wt, hp, am, mpg)
select(mtcars, contains("a"))
select(mtcars, starts_with("A"))
select(mtcars, ends_with("p"))

# %>% pipe Operator
mtcars %>% 
  select(mpg, hp, am)

# filter
mtcars %>% 
  select(mpg, hp, wt, am) %>%
  filter(mpg > 30 | am == 1) ## am == 1 : manual gear
  
# rownames_to_column
mtcars %>% 
  rownames_to_column() %>%
  select(model = rowname, 
         milePerGallon = mpg,
         hoursePower = hp,
         weight = wt) %>%
  head()

# rename column
mtcars<- mtcars %>% 
  rownames_to_column() %>%
  rename(model = rowname)

# filter model names (regular expression :grepl()  )    
mtcars %>%
  select(model, mpg, hp, wt) %>%
  filter(grepl("^M", model)) 

# create new column: mutate()
mtcars %>%
  select(model, mpg, hp) %>%
  mutate(mpg_double = mpg*2, mpg_log = log(mpg), hp_double = hp)

# arrange sort data
mtcars %>% 
  select(model, am, mpg) %>%
  arrange(am, desc(mpg))

# create label
# am: 0 = auto, 1 = manual

mtcars <- mtcars %>% 
  mutate(am = ifelse(am == 0, "auto", "manual"))

# create dataframe from scratch
df <- data.frame(
  id = 1:5,
  country = c("Thailand", "Korea", "Japan", "USA", "Belgium")
)

# case when

df <- df %>%
  mutate(region = case_when(
    country %in% c("Thailand", "Japan", "Korea") ~ "Asia",
    country == "USA" ~ "America",
    TRUE ~ "Other Regions" # same as `else`
  ))


#bind rows
df2 <- data.frame(id=6:10, country = c("Germany", "Italy", "Sweden","Canada", "Malaysia"))

full_df <- df %>%
  bind_rows(df2)

#bind rows (way2: create list of df)
list_df = list(df,df2)
full_df <- bind_rows(list_df)

#fix NA value of region in some rows
full_df[6:10,] <- full_df[6:10,] %>% 
  mutate(region = case_when(
    country %in% c("Germany", "Italy", "Sweden") ~ "Europe",
    country == "Canada" ~ "America",
    TRUE ~ "Asia"
  ))

## let's use SQL to create region column in df
full_df <- full_df[,1:2]
sqldf(
  "select 
    *,
    case
      when country in ('Thailand', 'Japan', 'Korea', 'Malaysia') then 'Asia'
      when country in ('USA', 'Canada') then 'America'
      when country in ('Germany', 'Italy', 'Sweden') then 'Europe'
      else 'Other region'
    end as region
   from full_df"
)

## summarize + group_by
result <- mtcars %>% 
  mutate(vs = case_when(
    vs == 0 ~ "v-shape",
    vs == 1 ~ "straight"
  )) %>%
  group_by(am, vs) %>%
  summarise(avg_mpg = mean(mpg),
            sum_mpg = sum(mpg),
            min_mpg = min(mpg),
            max_mpg = max(mpg),
            n = n())

View(result)
write.csv(result, "result.csv", row.names = FALSE)
