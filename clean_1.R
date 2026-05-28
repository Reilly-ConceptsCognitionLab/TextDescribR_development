#' clean_1
#'
#' Initial text cleaning tokenizing language sample by sentences. Cleaning steps include: transform text to lowercase, omit decimals
#' (via regex embedded within numbers), standardize apostrophe variants to UTF8 encoding, replace special characters (%, $) with words
#' (e.g., percent, dollar), replace hyphens with single space, reduce ellipses (...) to a single period via regex, split sentences one sentence
#' per row, remove all remaining non-alphabetic characters, derive descriptive stats for total number of sentences (nrow), total words per sentence,
#' add sentence ID variable, split and unlist sentences to one word per row format, add word ID sequence variable
#' @name clean_1
#' @param dat takes dataframe with nominally two columns, 'doc_id' and 'text'
#' @param multidoc argument specifying whether the corpus is one document or many
#' @returns
#' list of two dataframes, dataframe 1 contains raw corpus split in tidy format one word per row, dataframe 2 contains summary statistics (mean, SD, range) for sentence stats for populating in next function
#' @importFrom dplyr across
#' @importFrom dplyr bind_rows
#' @importFrom dplyr everything
#' @importFrom dplyr filter
#' @importFrom dplyr group_by
#' @importFrom dplyr left_join
#' @importFrom dplyr matches
#' @importFrom dplyr mutate
#' @importFrom dplyr n_distinct
#' @importFrom dplyr rename
#' @importFrom dplyr select
#' @importFrom dplyr summarize
#' @importFrom dplyr ungroup
#' @importFrom magrittr %>%
#' @importFrom purrr map_dfr
#' @importFrom stats sd
#' @importFrom stats na.omit
#' @importFrom stringr str_subset
#' @importFrom stringr str_trim
#' @importFrom tibble tibble
#' @importFrom tidyr pivot_longer
#' @importFrom tidyr pivot_wider
#' @importFrom tidyr separate
#' @importFrom tidyselect where
#' @export

#Have R check doc_id field and if more than one level assumes a multidocument corpus
#Generate number of documents in the corpus using levels(dat$doc_id) after coercing doc_id to factor


clean_1 <- function(dat, text_field='my_text', doc_id_field='doc_id') {
  # Select and prepare data
  x <- dat

  # Convert the specified document ID field to factor
  x[[doc_id_field]] <- as.factor(x[[doc_id_field]])

  # Convert the text to lowercase
  x[[textfield]] <- tolower(x[[textfield]])

  return(x)
}








