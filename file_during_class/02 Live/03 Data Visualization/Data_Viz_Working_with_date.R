library(lubridate)
library(tidyverse)

# working with date
data_df <- data.frame(
  x = c(
    "2023-02-25",
    "2023-02-26",
    "2023-02-27",
    "2023-02-28",
    "2023-03-01"
  ))

data_df %>% mutate(
  date_x = ymd(x),
  year = year(date_x),
  month = month(date_x),
  day = day(date_x),
  wday = wday(date_x),
  week = week(date_x)
)

data_df %>% mutate(
  date_x = ymd(x),
  year = year(date_x),
  month = month(date_x, label=T, abbr=F),
  day = day(date_x),
  wday = wday(date_x, label=T, abbr=F),
  week = week(date_x)
)

# dirty format
data_df <- data.frame(
  x = c(
    "02/2023/23",
    "02/2023/25",
    "03/2023/01",
    "04/2023/2",
    "05/23/9"
  ))


data_df %>% mutate(
  date_x = myd(x), # <-- depends on format of date data
  year = year(date_x),
  month = month(date_x, label=T, abbr=F),
  day = day(date_x),
  wday = wday(date_x, label=T, abbr=F),
  week = week(date_x)
)

