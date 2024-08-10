## For loop

friends <- c("Toy", "John", "Mary")

for (friend in friends) {
  print(paste("Hi! ",friend))
}

## Vectorization
paste("Hi!", friends)

nums <- c(5, 10, 12, 20, 25)
nums <- nums +2
