library(RPostgreSQL)

## connect to PostgresSQL (elephantSQL.com)
con <- dbConnect(PostgreSQL(), 
          host = "arjuna.db.elephantsql.com", #server
          port = 5432,# 5432 default for PostgresSQL
          user = "xtklchii",
          pass = "ftzSoD-ORMJAzLezQwdXVsT2bkH7U7at",
          dbname = "xtklchii")

dbListTables(con)

## write table
dbWriteTable(con, "cars", mtcars)
dbListFields(con, "cars")

## getQuery
dbGetQuery(con, "select count(*) from cars")
dbGetQuery(con, "select * from cars limit 10")

#disconnect
dbDisconnect(con)
