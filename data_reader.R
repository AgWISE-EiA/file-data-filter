#' Read Excel File and Filter Data Based on Dynamic Columns and Comparators
#'
#' This function reads an Excel file located at the specified path and allows for
#' dynamic filtering of the data based on multiple columns and their corresponding
#' comparators.
#'
#' @param file_path A character string specifying the path to the Excel file.
#' @param sheet_name A character string specifying the name of the sheet to read
#'                  from the Excel file (default is NULL, which reads the first sheet).
#' @param filters A list of filter specifications, each containing the following components:
#'                \itemize{
#'                  \item \code{column_name}: A character string specifying the name of the column to filter.
#'                  \item \code{comparator}: A character string specifying the comparator (e.g., "==", "!=", ">", "<").
#'                  \item \code{filter_value}: A value to filter the data in the specified column by.
#'                }
#'                Multiple filters can be applied to filter the data based on different columns and criteria.
#'                (default is an empty list, which means no filtering).
#'
#' @return A data frame containing the Excel data. If filters are specified, the resulting data frame will
#'         contain only the rows that meet the filtering criteria.
#'
#' @examples
#' # Read an Excel file without filtering
#' data <- read_and_filter_excel("your_excel_file.xlsx")
#'
#' # Define dynamic filters (column_name, comparator, and filter_value)
#' filters <- list(
#'   list(column_name = "Column1", comparator = "==", filter_value = "Value1"),
#'   list(column_name = "Column2", comparator = ">", filter_value = 100)
#' )
#'
#' # Apply dynamic filtering
#' filtered_data <- read_and_filter_excel("your_excel_file.xlsx", filters = filters)
#'
#' # View the resulting data
#' head(filtered_data)
#'
#' @seealso \code{\link{readxl::read_excel}}
#' @seealso \code{\link[dplyr]{filter}}
#'
#' @importFrom readxl read_excel
#' @importFrom dplyr filter
#'
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