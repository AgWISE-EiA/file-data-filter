read_and_filter_excel <- function(file_path,sheet_name = NULL, filters = list()) {
  # Check if the file exists
  if (!file.exists(file_path)) {
    stop("File not found.")
  }
  
  if (is.null(sheet_name)) {
    data <- readxl::read_excel(file_path)
  } else {
    data <- readxl::read_excel(file_path, sheet = sheet_name)
  }
  
  # Check if filters are specified
  if (length(filters) > 0) {
    for (filter in filters) {
      column_name <- filter$column_name
      comparator <- filter$comparator
      filter_value <- filter$filter_value
      
      # Apply the filter based on the specified column and comparator
      if (comparator == "==") {
        data <- data %>% dplyr::filter(get(column_name) == filter_value)
      } else if (comparator == "!=") {
        data <- data %>% dplyr::filter(get(column_name) != filter_value)
      } else if (comparator == ">") {
        data <- data %>% dplyr::filter(get(column_name) > filter_value)
      } else if (comparator == "<") {
        data <- data %>% dplyr::filter(get(column_name) < filter_value)
      }
      
      # You can add more comparators as needed
    }
  }
  
  # Return the resulting data frame
  return(data)
}