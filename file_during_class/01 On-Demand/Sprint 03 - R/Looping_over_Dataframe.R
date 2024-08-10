# loop over a dataframe
data() #browse the built-in datasets in R



data(USArrests)
View(USArrests) #Preview Dataframe
nrow(USArrests)
ncol(USArrests)
head(USArrests)

#print name without loop
names(USArrests)

#print name with loop
for (i in 1:ncol(USArrests)) {
  print(names(USArrests[i]))
}

#mean by column
col_name = names(USArrests)
cal_mean_by_col <- function(df) {
  for (i in 1:ncol(df)) {
    avg <-mean(df[[i]]) #df [[i]] เป็นการดึง column vector ออกมาจาก dataframe เลยตรง ๆ (แทนการเขียน df[,1])
    print(paste(col_name[i],"Mean =",avg))
  }
}