## Data Frame

friends <- c("Wan", "Ink", "Aan", "Bee", "Top")

ages <- c(26, 27, 32, 31, 28)

locations <- c("New York", "London", "London", "Tokyo", "Manchester")

movie_lover <- c(TRUE, TRUE, FALSE, TRUE, TRUE)

## Create Data Frame from list
my_list <- list(Friends = friends, 
                Ages= ages, 
                Locations = locations, 
                Movie = movie_lover)

df <- data.frame(my_list)

##Subset (การดึงข้อมูล)

#subset ด้วย location
friends
friends[1]
friends[1:3] 
friends[c(1,3,5)]

#subset ด้วย condition
ages 
ages[ ages > 30] 

#subset ด้วย names
names(ages) <- friends  #function names() = ใส่ชือแต่ละ column ใน vector
ages[names = "Wan"]

#Subset Data Frame
df

df[, c(1,2)] #ทุก row, column 1 กับ 2
df[, c("Friends","Ages")] #เหมือน line 38 แต่เปลี่ยนมาดึงด้วยชื่อ column แทน
df[1:3,] #ทุก column, เฉพาะ 3 row แรก
df[c(1,3,5),] #ทุก column เฉพาะ row ที่ 1, 3, 5

df[df$Movie == TRUE,] #subset with filtering data


   