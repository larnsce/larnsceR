#' Group and summarize data by multiple variables
#'
#' This function groups a data frame by multiple variables and calculates summary statistics for multiple variables.
#'
#' @param data A data frame
#' @param group_vars A character vector of variable names to group by
#' @param summary_vars A character vector of variable names to calculate summary statistics for
#'
#' @return A data frame with one row for each combination of grouping variables and one column for each summary statistic
#'
#' @import dplyr
#' @import tidyr
#' @export
#' @examples
#'
#' # Load mtcars dataset
#'
#' data(mtcars)
#'
#' # Group and summarize data by number of cylinders and transmission type
#' group_summarize(mtcars, c("cyl", "am"), c("hp", "mpg"))
#'
group_summarize <- function(data, group_vars, summary_vars) {
  data %>%
    dplyr::group_by(dplyr::across(all_of(group_vars))) %>%
    dplyr::summarize(dplyr::across(all_of(summary_vars),
                                   list(mean = ~mean(.x, na.rm = TRUE),
                                        median = ~median(.x, na.rm = TRUE),
                                        min = ~min(.x, na.rm = TRUE),
                                        max = ~max(.x, na.rm = TRUE),
                                        sd = ~sd(.x, na.rm = TRUE),
                                        iqr = ~IQR(.x, na.rm = TRUE)),
                                   .names = "{col}_{fn}"))
}



