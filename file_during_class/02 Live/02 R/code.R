# basic knowledge programming
# 1. variable
# 2. data types
# 3. data structures
# 4. control flow
# 5. function

# create variable
income <-28000
expense <- 19500
saving <-income - expense 

# remove variable
rm(saving)
rm(income)
rm(expense)

# data types
# numeric, character (text)
# date, logical (TRUE, FALSE)

my_age <- 34
my_name <- "hello"
movie_lover <- TRUE

class(my_name)
class(my_age)
class(movie_lover)

is.numeric(my_name)
is.numeric(my_age)
is.logical(my_name)

# YYYY-MM-DD
wantee <- "2023-02-04"
class(wantee)
wantee <- as.Date(wantee)
class(wantee)

# data structure
# 1. vector (array)
# 2. matrix
# 3. list
# 4. dataframe

# vector collect only one data type
friends <- c("kong", "cake", "poom", "thor")

#subsetting
friends[1:2]
friends[c(1,3,4)]

friends[1] <- "Ditto"
friends[5] <- "PP"
friends[3:4] <- c("A","B")
friends

which(friends == "A")
friends[which(friends == "A")]

# matrix, vector 2 dimension
# R case sensitive
m <- matrix(1:10)
m <- matrix(1:10, ncol = 2, byrow = TRUE)

m1 <- matrix(c(5,2,10,4), ncol = 2, byrow = FALSE)
m2 <- matrix(c(1,2,5,7), ncol = 2, byrow = FALSE)
m1
m2
m1*m2 

y <- 1:6
dim(y) <- c(3,2)y #create to exists variable

# list
# can collect multiple data types /objects

my_playlist <- list(
  fav_movie= c("The Dark Knight", "Harry Potter", "Spider Man"),
  fav_song = c("Don't Cry", "Don't Look Back"),
  fav_artist = c("John Mayer", "Blackpink", "PREP", "Bodyslam")
)
  #fav_movie, fav_song, fav_artist => "Key", The Dark Knight, ... , New Jeans => "Value" 
  #list = Key + Value

my_playlist
my_playlist$fav_movie
my_playlist$fav_movie[2]
my_playlist[1] #return fav_movie both key and value
my_playlist[1][2] #return NULL
my_playlist[[1]] #return all value of fav_movie
my_playlist[[1]][2] #return 2nd value of fav_movie

## dataframe
mtcars #built-in df

friends <- c("toy", "jisoo", "lisa", "rose", "jenny")
ages <- c(34, 25, 27, 26, 28)
movie_lover <- c(F, F, T, F, T)

c(length(friends), length(ages), length(movie_lover)) 
#checking size of vectors are the same before combine in a dataframe

df <- data.frame(id=1:5,friends, ages, movie_lover)
df

#alternative approach to create dataframe

customers <- list(
  friends = c("John", "David", "Anna"),
  ages = c(25, 20, 19),
  movie = c(T, T, F)
)

df2 <- data.frame(customers)

count_movie_lover <- sum(df2[3]) #True = 1, False  = 0 สามารถนำมาคำนวณได้เลย

#create Null value
ages2 <- c(30, 25, 22, NA, 25)
#check NA value
is.na(ages2)
sum(is.na(ages2))

#replace data in dataframe
toy_location <- which(df$friends=="toy")
df$friends[toy_location] <- "Toy"

#filtering data in dataframe with condition
cond1 <- df$ages > 25 & df$movie_lover == F
cond2 <- df$ages > 30 | df$movie_lover == T
df[cond,]
df[cond2,]

#write csv
write.csv(df, "friend.csv", row.names = FALSE) #row.names = F  to exclude a column which contains row number.


#read csv
df <- read.csv("friend.csv")
View(df)
  #alter 
  #read_csv("friend.csv") #need library
  
## control flow + function

## user defined function 
add_two_nums <- function(v1, v2) {
  return(v1 + v2)
}

cube <- function(x) x**3 #short term

#able to set default argument for a function
my_power <- function(base=2, pow=3) {
  return(base**pow)
}

#get input from user
greeting_bot <- function() {
  username = readline("What is your name: ")
  print(paste("Hello!", username))
  
  your_age = readline("How old are you: ")
  print(paste("You are", your_age, "years old."))
}


## control flow
## if, for, while

grading_cal <- function(score) {
  if (score >= 80) {
    print("Passed")
  } else if (score >= 50) {
    print("Just OK")
  } else {
    print("You have to retake the exam!")
  }
} 

#while loop example

count <- 0 #counter variable

while (count < 5) {
  print(":D")
  count <- count+1 #update counter
}

new_chatbot <- function() {
  print("Instruction: type 'exit' to exit the program")
  while(TRUE) {
    text = readline("What is yourname: ")
    if (text == "exit") {
      print("Thank you for using chatbot.")
      break
    }
    print(paste("Hello !",text))
  }
}

# for loop
friends <- c("toy", "lisa", "jisoo")
for(friend in friends) {
  print(paste("Hi!", friend))
}

# above, for loop is not necessary.
print(paste("Hi!", friends))

## Regular Expression
state.name[grep("^K", state.name)]

state.name[grep("^k", state.name, ignore.case = "T")]
# 'K' and 'k' are the same.



