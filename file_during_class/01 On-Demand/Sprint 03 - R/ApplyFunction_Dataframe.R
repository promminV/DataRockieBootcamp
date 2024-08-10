#apply function (ทำ aggregate function วน loop แต่ละ column) 

avg_by_row_mtcars <- apply(mtcars, MARGIN = 2, sum)
min_by_row_mtcars <- apply(mtcars, MARGIN = 2, min)
max_by_row_mtcars <- apply(mtcars, MARGIN = 2, max)
mean_by_row_mtcars <- apply(mtcars, MARGIN = 2, mean)

df <- data.frame(avg_by_row_mtcars, min_by_row_mtcars, max_by_row_mtcars, mean_by_row_mtcars)
