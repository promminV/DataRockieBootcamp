# load library
library(RSQLite)

# step 1: connect to SQLite database (.db file)
conn <- dbConnect(SQLite(), "chinook.db")

# step 2: get data
dbListTables(conn)
dbListFields(conn, "customers")

df <- dbGetQuery(conn, "select * from customers where country = 'USA'")
df2 <- dbGetQuery(conn, "select * from customers where country = 'United Kingdom'")

# step 3: close connection
dbDisconnect(conn)
