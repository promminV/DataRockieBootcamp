# install.packages("dplyr") # (installed already)
library(dplyr)

## read csv file into RStudio
imdb <- read.csv("imdb.csv", stringsAsFactors = FALSE)
View(imdb)

## review data structure
glimpse(imdb) #detail ; column name, data type, sample of data

## print head or tail of data
head(imdb, 10)
tail(imdb, 10)

## select columns
select(imdb, MOVIE_NAME, RATING)
select(imdb, 1, 5)

select(imdb, movie_name = MOVIE_NAME, release_year = YEAR)

## pipe operator ( %>% ) 
  
  # select(database,col1,col2,...) -> re-coding as 
  # database %>% select(col1,col2,...)
  # data pipeline able to added ... 
  # database %>% select(col1,col2,...) %>% select(colA, colB, colC) %>% ...

imdb %>% select(movie_name = MOVIE_NAME, release_year = YEAR)

## filter data
filter(imdb, SCORE > 9.0)

imdb %>% filter(SCORE > 9.0)

names(imdb) <- tolower(names(imdb)) #lower column names

imdb %>% 
  select(movie_name, year, score) %>% 
  filter(score >= 9 & year > 2000)

imdb %>% 
  select(movie_name, length, score) %>% 
  filter(score == 8.8 | score == 8.3 | score == 9.0)

imdb %>% 
  select(movie_name, length, score) %>% 
  filter(score %in% c(8.8, 8.3, 9.0))

## filter string column
imdb %>% 
  select(movie_name, genre, rating) %>%
  filter(grepl("Drama", imdb$genre))

imdb %>% 
  select(movie_name, genre, rating) %>%
  filter(grepl("king", imdb$movie_name))

## create new columns
imdb %>% 
  select(movie_name, score, length) %>% 
  mutate(score_group = if_else(score >= 9, "High Rating", "Low Rating"),
         length_group = if_else(length >= 120, "Long Film", "Short Film"))

imdb %>% 
  select(movie_name, score) %>% 
  mutate(score_group = if_else(score >= 9, "High Rating", "Low Rating"),
         length_group = if_else(length >= 120, "Long Film", "Short Film"))
## arrange data
imdb %>% 
  arrange(length) %>%
  head(10)
  
imdb %>% 
  arrange(desc(length)) %>% #descending order (large to small)
  head(10)

imdb %>%
  arrange(rating, desc(length)) %>% # order by rating, descending order for each rating group by length
  head(10)
  
## summarize and group by (Statistics Summary)
imdb %>% 
  filter(rating != "") %>%
  group_by(rating) %>%
  summarize(mean_length = mean(length),
            sum_length = sum(length),
            sd_length = sd(length),
            min_length = min(length),
            max_length = max(length),
            n = n()) #n() = count 

## join data
favorite_films <- data.frame(id = c(5,10,25,30,98))

favorite_films %>% 
  inner_join(imdb, by = c("id" = "no"))

## write csv file
imdb_prep <- imdb %>% 
  select(movie_name, released_year = year, rating, length, score) %>%
  filter(rating == "R" & released_year > 2000)
## export file
write.csv(imdb_prep, "imdb_prep.csv", row.names = FALSE)
