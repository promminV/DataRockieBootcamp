##Convert Data Type

## main functions
## as.numeric()
## as.character()
## as.logical()

x <- 100
class(x)
print(x)


char_x <- as.character(x)
class(char_x)
print(char_x)

num_x <- as.numeric(char_x)
class(num_x)
print(num_x)

## logical : TRUE/ FALSE
as.logical(0)
as.logical(1)
as.numeric(TRUE)
as.numeric(FALSE)
