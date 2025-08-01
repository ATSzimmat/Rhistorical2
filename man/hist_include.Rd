% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hist_include.R
\name{hist_include}
\alias{hist_include}
\title{Add your own source excerpts}
\usage{
hist_include(new_data)
}
\arguments{
\item{new_data}{Your dataframe with the new source excerpts}
}
\value{
the_sources with the new source excerpts
}
\description{
With this function, you can add your own source excerpts with the corresponding metadata
as a dataframe to the dataset the_sources. However, the columns of your dataset must match those of
the_sources and must be in the same order and with the same variable types.
}
\examples{
# Some example data
new_data <- data.frame(context = "Corinthian War", event = "NewBattle1", author = "Plutarch",
 work = "Work3", citation = "NewCitation6", text_ID = 15,
 text = "The fleets clashed near Cnidus.", event_type = "battle", stringsAsFactors = FALSE)
# Adjust the column data types to match those of the_sources
new_data$context <- as.factor(new_data$context)
new_data$event_type <- as.factor(new_data$event_type)
}
