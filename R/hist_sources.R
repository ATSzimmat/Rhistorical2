#' Create a filtered source dataframe
#'
#' This function filters the dataset the_sources according to the specified parameters.
#' If output_text = TRUE, the result text is provided formatted as output, ready to be incorporated into a source paper document
#'
#' @param author The author to filter sources by (e.g. "Xenophon")
#' @param context The historical context (e.g. "Corinthian War")
#' @param event_type The event type (e.g. "battle")
#' @param event The exact event (e.g. "Battle1")
#' @param work The work from which you want to have source excerpts
#' @param citation The citation (e.g. "Citation1") of the respective source excerpts
#' @param output_text If TRUE the result text is provided formatted as output
#'
#' @return A filtered source dataframe (if output_text = FALSE)
#' @export
#'
#' @examples
#' # All source excerpts from Xenophon on the Corinthian War as dataframe
#' Xenophon_Corinthian <- hist_sources(author = "Xenophon", context = "Corinthian War")
#'
#' # As source compilation
#' hist_sources(author = "Xenophon", context = "Corinthian War", output_text = TRUE)
hist_sources <- function(
    author = NULL,
    context = NULL,
    event_type = NULL,
    event = NULL,
    work = NULL,
    citation = NULL,
    output_text = FALSE) {

  data <- the_sources

  if (!is.null(author)) {
    data <- data[data$author == author, ]
  }
  if (!is.null(context)) {
    data <- data[data$context == context, ]
  }
  if (!is.null(event_type)) {
    data <- data[data$event_type == event_type, ]
  }
  if (!is.null(event)) {
    data <- data[data$event == event, ]
  }
  if (!is.null(work)) {
    data <- data[data$work == work, ]
  }
  if (!is.null(citation)) {
    data <- data[data$citation == citation, ]
  }

  if (output_text) {
    output <- paste0(data$text_ID, " – ", data$citation, "\n", trimws(data$text))
    cat(paste(output, collapse = "\n\n"))
  } else {
    return(data)
  }
}
