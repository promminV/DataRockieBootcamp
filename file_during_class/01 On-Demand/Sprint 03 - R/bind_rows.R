library(dplyr) #necessary library for bind rows (bind rows = UNION in sql)

econ <- read_excel("students.xlsx", sheet =1)
business <- read_excel("students.xlsx", sheet =2)
data <- read_excel("students.xlsx", sheet =3)

#create list first, and then bind rows ...
list_df <- list(econ, business, data)

full_df <- bind_rows(list_df)
