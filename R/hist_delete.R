#' Delete unintended source excerpts
#'
#' This function deletes specific rows from a source dataframe created with hist_sources (text_output set on FALSE),
#' identified by their text_ID values.
#'
#' @param filtered_sources Your current source dataframe
#' @param ID The text_ID of the source excerpts you want to remove
#'
#' @returns The source dataframe without the source excerpts you deleted
#' @export
#'
#' @examples
#' # Example source dataframe created with hist_sources
#' Xenophon_Corinthian <- hist_sources(author="Xenophon",context="Corinthian War", output_text = FALSE)
#' # Delete the source excerpts with IDs 5 and 14
#' hist_delete(Xenophon_Corinthian, ID = c(5, 14))
hist_delete <- function(filtered_sources, ID) {
  ID <- as.character(ID)
  filtered_sources[!(filtered_sources$text_ID %in% ID), ]
}
