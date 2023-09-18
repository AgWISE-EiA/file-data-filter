library(readxl)
library(dplyr)

# Define a function to read an Excel file
read_excel_file <- function(file_path,sheet_name=NULL,column_name=NULL, filter_value=NULL) {
  # Check if the file exists
  if (!file.exists(file_path)) {
    stop("File not found.")
  }
  
  # Read the Excel file into a data frame
  if (is.null(sheet_name)) {
    data <- readxl::read_excel(file_path)
  } else {
    data <- readxl::read_excel(file_path, sheet = sheet_name)
  }
  
  # Check if filtering is requested
  if (!is.null(column_name) && !is.null(filter_value)) {
    # Filter the data frame based on the specified column and value
    filtered_data <- subset(data, data[[column_name]] == filter_value)
    return(filtered_data)
  } else {
    # Return the entire data frame without filtering
    return(data)
  }
}
