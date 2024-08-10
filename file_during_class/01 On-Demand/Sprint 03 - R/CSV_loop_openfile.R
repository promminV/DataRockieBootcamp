#loop for open all sheets in a csv file

excel_sheets_list <- function(excel_name) { 
  result <- list() #create empty list
  for (i in 1:length(read_excel(excel_name))) {
    result[[i]] <- read_excel(excel_name,sheet = i) #add new list to "result" for each loop
  }
  print(result)
}

## create as a function for reusing in the future...