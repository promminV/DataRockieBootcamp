## Mini-Project : Data Transformation on nycflights13 with dplyr

install.packages('nycflights13')

library(tidyverse)
library(nycflights13)

glimpse(flights) # explore overall

## transformation: select (+ techniques)
flights %>% select(starts_with('d')) # select start with 'd' columns

flights %>% select(year:dep_delay) # select year to dep_delay columns

flights %>% select(-(year:dep_delay)) # select all except year to dep_delay columns


## transformation: filter
# find flights that had

delay_upper_2hrs <- flights %>%
  select(flight, arr_delay) %>%
  filter(arr_delay >= 120) # delay at least 2 hours = 120 min

flew_to_houston <- flights %>%
  select(flight, dest) %>%
  filter(dest %in% c('IAH', 'HOU')) # flew to Houston (IAH or HOU airports)

op <- flights %>%
  select(flight, carrier) %>%
  filter(carrier %in% c('UA', 'AA', 'DL')) # operate by United, American or Delta airline

summer_flights <- flights %>% # summer flights (from July to Sept)
  select(flight, month) %>%
  filter(month >= 7 & month <= 9) 

arr_late_dept_early <- flights %>%
  select(flight, arr_delay, dep_delay) %>%
  filter(arr_delay >= 120 & dep_delay < 0) # arrived late >= 2 hrs, but early departed

# find number of fligths that have NA in dep_time
na_count <- flights %>% 
  select(dep_time) %>%
  is.na() %>% sum()

  # sum(is.na(flights$dep_time)) # (base-r approach)

## transformation: arrange
# explore top 5 of delay flight >= 2 hours
top5_delay <- flights %>%
  select(flight, arr_delay) %>% 
  filter(arr_delay >= 120) %>%
  arrange(desc(arr_delay)) %>% # desc = largest -> smallest
  head(5)

# sort na value to the top
na_dep_time <- flights %>%
  select(flight, dep_time) %>%
  arrange(desc(is.na(dep_time))) # order by TRUE/ FALSE of is.na

# sort to find most delayed flights
delayed_sort <- flights %>%
  select(flight, arr_delay) %>%
  arrange(arr_delay)

## transformation: mutate (create new column)
new_val <- flights %>% 
  select(flight, dep_time) %>%
  mutate(new_dep = dep_time + 20)

## transformation: transmute (create new column, separate from old table)
flights %>% 
  transmute(new_dep = dep_time + 20)

## transformation: summarize + group by
# summary stats matrix -> mean, med, mode, .. etc.

# approach 1 
flights %>% 
  select(dep_time) %>%
  filter(dep_time != is.na(dep_time)) %>%
  pull() %>% # extract value from tibble
  mean()

# approach 2 (directly use tibble -> need summarize() )
flights %>%
  filter(dep_time != is.na(dep_time)) %>%
  summarize(
    mean = mean(dep_time)
  )
  # simplify filter part (cause bugs in some cases)
flights %>%
  summarize(
    mean = mean(dep_time, na.rm=TRUE)
  )

# + group by (do summary stats loop over column)
flights %>%
  group_by(flight) %>%
  summarize(
    mean = mean(dep_time, na.rm=TRUE),
    med = median(dep_time, na.rm=TRUE),
    min = min(dep_time, na.rm=TRUE),
    max = max(dep_time, na.rm=TRUE),
    range = max-min) # some bugs in this approach
  
  #try new approach
flights %>%
  filter(dep_time != is.na(dep_time)) %>%
  group_by(flight) %>%
  summarize(
    mean = mean(dep_time),
    med = median(dep_time),
    min = min(dep_time),
    max = max(dep_time),
    range = max-min)
  # note: results are rounded because of tibble (can be customized).
