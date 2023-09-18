
#library(readxl)
#library(dplyr)

source("data_reader.R")


# Example usage:
file_path <- "Data/potato.xlsx"

filters <- list(
  list(column_name = "fertilizer", comparator = "!=", filter_value = "DAP"),
  list(column_name = "yieldClass", comparator = "<=", filter_value = 7)
)

result <- read_and_filter_excel(file_path = file_path,filters = filters)

#result <- read_and_filter_excel(file.choose())

# View the first few rows of the data
head(result)

