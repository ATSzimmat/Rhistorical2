#' Filter the source dataframe by the occurrence of different words
#'
#' This function filters a source dataframe created with hist_sources (text_output set on FALSE) by the occurrence of source excerpts containing specific words
#' Use + to require multiple words in the same text (e.g. "king+battle"). Multiple arguments represent an OR condition. Case sensitivity is ignored.
#'
#' @param filtered_sources Your current source dataframe
#' @returns ... One or more character strings to search for
#' @return A filtered dataframe ready to be further adapted or processed into a source paper
#' @export
#' @importFrom dplyr filter
#' @importFrom stringr str_detect fixed
#'
#' @examples
#' # Example source dataframe created with hist_sources
#' Xenophon_Corinthian <- hist_sources(author="Xenophon",context="Corinthian War", output_text = FALSE)
#' # Only source excerpts containing "king"
#' hist_contain(Xenophon_Corinthian, "king")
#' # Only source excerpts containing "king" or "Thebans"
#' hist_contain(Xenophon_Corinthian, "king","Thebans")
#' # Only source excerpts containing "king", "battle" and "Thebans"
#' hist_contain(Xenophon_Corinthian, "king+battle+Thebans")
#' # Only source excerpts containing "king+battle" or "Thebans"
#' hist_contain(Xenophon_Corinthian, "king+battle","Thebans")
hist_contain <- function(filtered_sources, ...) {
  words <- c(...)

  make_filter <- function(entry) {
    if (grepl("\\+", entry)) {
      sub_words <- strsplit(entry, "\\+")[[1]]
      return(function(txt) all(str_detect(txt, fixed(sub_words, ignore_case = TRUE))))
    } else {
      return(function(txt) str_detect(txt, fixed(entry, ignore_case = TRUE)))
    }
  }

  filters <- lapply(words, make_filter)

  filtered_rows <- sapply(filtered_sources$text, function(txt) {
    any(sapply(filters, function(word_list) word_list(txt)))
  })

  result <- filter(filtered_sources, filtered_rows)
  return(result)
}
