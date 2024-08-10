# create postgeSQL in elephantsql
# connect from R

library('RPostgreSQL')

# database name, host name, port, uid, password

host_name = "arjuna.db.elephantsql.com" #server name
port_no = 5432 # postgreSQL default port
uid = "xtklchii"
pwd = "ftzSoD-ORMJAzLezQwdXVsT2bkH7U7at"

drv <- dbDriver("PostgreSQL") # load driver

# create connection
connect <- dbConnect(drv, 
                     dbname = uid,
                     host = host_name,
                     port = port_no,
                     user = uid,
                     password = pwd)
# create table
name <- c("Kong", "Cake", "Poom", "Dao")
id <- c("1", "2", "3", "4")
df <- data.frame(id, name)

# write table to PostgreSQL server
dbWriteTable(connect, "friends", df)

# list tables in server
dbListTables(connect)

# list fields in table
dbListFields(connect, "friends")

# read table in server 
friends_df <- dbReadTable(connect, "friends")

# get query in server
dbGetQuery(connect, "select name, id from friends order by name")

# remove table
dbRemoveTable(connect, "friends")

# turn off connection
dbDisconnect(connect)
