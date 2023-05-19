#' Credit Sentence
#'
#' This function takes a dataframe and a grouping variable as inputs. It then
#' groups the dataframe by the grouping variable column using group_by(),
#' and then calculates the credit_statement and sentence columns using
#' summarise(). In the paste0() function for the sentence column,
#' it wraps the name variable in <b> tags to make it bold.
#'
#' @param data A dataframe.
#' @param group_var A grouping variable.
#'
#' @return A dataframe with two columns: credit_statement and sentence.
#'
#' @import dplyr
#'
#' @examples
#'
#' df_credit <- read.csv(
#'   "https://raw.githubusercontent.com/Global-Health-Engineering/manuscript-qechairquality/main/data/credit.csv") |>
#'    tidyr::unite("name", first_name:surname, sep = "")
#'
#' credit_sentence(data = df_credit, group_var = name)
#'
#' @export
credit_sentence <- function(data, group_var) {
  data %>%
    dplyr::group_by({{group_var}}) %>%
    dplyr::summarise(credit_statement = paste(credit_statement, collapse = ",")) %>%
    dplyr::summarise(sentence = paste0("<b>", name, "</b>:", credit_statement, ".", collapse = " "))
}
