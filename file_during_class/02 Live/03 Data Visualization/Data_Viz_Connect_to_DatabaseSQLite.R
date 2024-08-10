library(tidyverse)
library(RSQLite)
library(RPostgreSQL)
library(lubridate)
library(janitor)

## connect database (SQL database)
con <- dbConnect(SQLite(), "chinook.db")

## list table names
dbListTables(con)

## list fields in a table
dbListFields(con, "customers")

## write SQL queries and keep in R as object df.
df <- dbGetQuery(con, "select * from customers limit 10")

#clean all column name into lower case***
clean_df <- clean_names(df)

## write JOIN syntax
df2 <- dbGetQuery(con, "select * from albums, artists 
                        where albums.ArtistId = artists.ArtistId")
clean_df2 <- clean_names(df2)

## write a table
dbWriteTable(con, "cars", mtcars)  # write a new table called "cars" to the connected database
cars <- dbGetQuery(con, "select * from cars limit 10")
## drop table
dbRemoveTable(con, "cars")

## close connection
dbDisconnect(con)
