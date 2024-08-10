## Matrix Generation
# way 1
x <- 1:25
length(x)
dim(x) <- c(5,5)

# way 2
help("matrix")
m1 <- matrix(1:25,ncol = 5)
m2 <- matrix(1:6, ncol = 3, nrow = 2, byrow = TRUE) #fill by row
m3 <- matrix(1:6, ncol = 3, nrow = 2, byrow = FALSE) #fill by column

## element wise computation
m2 + 100
m2*4
