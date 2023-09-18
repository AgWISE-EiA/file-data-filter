#' Read Excel File and Optionally Filter Data
#'
#' This function reads an Excel file located at the specified path and optionally
#' filters the data based on a specified column and filter value.
#'
#' @param file_path A character string specifying the path to the Excel file.
#' @param sheet_name A character string specifying the name of the sheet to read
#'                  from the Excel file (default is NULL, which reads the first sheet).
#' @param column_name A character string specifying the name of the column to use for filtering
#'                   (default is NULL, which means no filtering).
#' @param filter_value A value to filter the data in the specified column by
#'                    (default is NULL, which means no filtering).
#'
#' @return A data frame containing the Excel data. If filtering is applied,
#'         the resulting data frame will contain only the rows that meet the filtering criteria.
#' @export
#'
#' @examples
#' # Read an Excel file without filtering
#' data <- read_excel_file("your_excel_file.xlsx")
#'
#' # Read an Excel file and filter the data
#' filtered_data <- read_excel_file("your_excel_file.xlsx", sheet_name = "Sheet1",
#'                                  column_name = "ColumnName", filter_value = "FilterValue")
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
read_excel_file <- function(file_path, sheet_name = NULL, column_name = NULL, filter_value = NULL) {
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
  
  if (!is.null(column_name) && !is.null(filter_value)) {
    print(paste("Filtering data using column [", column_name, "] with value [", filter_value, "]", sep = ''))
    filtered_df <- data %>% dplyr::filter(get(column_name) == filter_value)
    return(filtered_df)
  }
  
  return(data)
}