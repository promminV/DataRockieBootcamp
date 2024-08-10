## List (can be contain data more than 1 type)

# sample data
my_name <- "Kong"
my_friends <- c("Wan", "Ink", "Zue")
m1 <- matrix(1:25, ncol=5)
R_is_cool <- TRUE

#create list
my_list <- list(item1 = my_name,
                item2 = my_friends,
                item3 = m1,
                item4 = R_is_cool)

#specific directory in list
my_list$item3
my_list$item4
