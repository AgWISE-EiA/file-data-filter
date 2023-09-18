
library(readxl)
library(dplyr)

source("data_reader.R")


# Example usage:
file_path <- "Data/potato.xlsx"
column_to_filter <- "fertilizer"  # Replace with the actual column name
filter_value <- "DAP"
sheet_name=NULL

result <- read_excel_file(file_path = file_path,column_name=column_to_filter, filter_value=filter_value)


filters <- list(
  list(column_name = "fertilizer", comparator = "==", filter_value = "DAP"),
  list(column_name = "yieldClass", comparator = "<", filter_value = 5)
)

result <- read_and_filter_excel(file_path = file_path,filters = filters)

#result <- read_excel_file(file.choose())

# View the first few rows of the data
head(result)

