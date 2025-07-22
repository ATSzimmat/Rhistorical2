#' Output a structured source compilation
#'
#' This function converts a source dataframe that you created with hist_sources into a structured source compilation ready to be incorporated into a source paper document
#'
#' @param filtered_sources The name of your current (filtered) source dataframe
#'
#' @returns A structured source compilation of the sources of the respective source dataframe
#' @export
#'
#' @examples
#' # Example source dataframe created with hist_sources
#' Xenophon_Corinthian <- hist_sources(author="Xenophon", context="Corinthian War", output_text = FALSE)
#' # Output the source-paper
#' hist_text(Xenophon_Corinthian)
hist_text <- function(filtered_sources) {
  formatted <- glue::glue(
    "{filtered_sources$text_ID} – {filtered_sources$citation}\n{trimws(filtered_sources$text)}"
  )
  cat(paste(formatted, collapse = "\n\n"))
}
