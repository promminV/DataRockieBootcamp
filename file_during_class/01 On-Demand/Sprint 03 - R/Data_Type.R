## Data Types

## 1. numeric
age <- 32
print(age)
class(age)

## 2. character
my_name <- "Kong"
my_university <- "Chulalongkorn University"
print(my_name)
print(my_university)
class(my_name); class(my_university)

## 3. logical
result <- 1+1 == 2
print(result)
class(result)

## 4. factor
animals <- c("Dog", "Cat", "Cat", "Hippo")
class(animals)
print(animals)

animals <- factor(animals)
class(animals)
print(animals)
  #factor เป็น data ประเภทตัวแปร ไว้ใช้ในการจัดกลุ่มทางสถิติ

## 5. data/time
time_now <- Sys.time()
print(time_now)
class(time_now)