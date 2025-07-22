#' Add your own source excerpts
#'
#' With this function, you can add your own source excerpts with the corresponding metadata
#' as a dataframe to the dataset the_sources. However, the columns of your dataset must match those of
#' the_sources and must be in the same order and with the same variable types.
#'
#' @param new_data Your dataframe with the new source excerpts
#' @returns the_sources with the new source excerpts
#' @export
#' @importFrom dplyr bind_rows
#' @examples
#' # Some example data
#' new_data <- data.frame(context = "Corinthian War", event = "NewBattle1", author = "Plutarch",
#'  work = "Work3", citation = "NewCitation6", text_ID = 15,
#'  text = "The fleets clashed near Cnidus.", event_type = "battle", stringsAsFactors = FALSE)
#' # Adjust the column data types to match those of the_sources
#' new_data$context <- as.factor(new_data$context)
#' new_data$event_type <- as.factor(new_data$event_type)
hist_include <- function(new_data) {
  required_cols <- names(the_sources)
  if (!identical(names(new_data), required_cols)) {
    stop("Error: The column names or order of the columns in this dataset do not match those in 'the_sources'. You can rework the column names using mutate() or the order using select().")
  }

  classes_the_sources <- sapply(the_sources, class)
  classes_new_data <- sapply(new_data, class)
  if (!identical(classes_new_data, classes_the_sources)) {
    stop("Error: The data types of the columns do not match those in 'the_sources'. You can rework them using as.factor() and as.character().")
  }

  the_sources <<- bind_rows(the_sources, new_data)
}

