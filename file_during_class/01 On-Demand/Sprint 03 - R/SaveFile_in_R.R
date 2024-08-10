#save a data in environment 
saveRDS(df, file = "df.rds")
#load file
df <- readRDS(file = "df.rds")

#save all data
save.image(file = "data.RData")
#load file
load(file = "data.RData")
