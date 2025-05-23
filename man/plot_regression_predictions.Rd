% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot-regression-predictions.R
\name{plot_regression_predictions}
\alias{plot_regression_predictions}
\title{Create ggplot2 plot of regression predictions}
\usage{
plot_regression_predictions(.data, .output = "list")
}
\arguments{
\item{.data}{The data from the output of the \code{extract_wflw_pred()}
function.}

\item{.output}{The default is "list" which will return a list of plots. The
other option is "facet" which will return a single faceted plot.}
}
\value{
A list of ggplot2 plots or a faceted plot.
}
\description{
Create a ggplot2 plot of regression predictions.
}
\details{
Create a ggplot2 plot of regression predictions, the actual, training,
and testing values. The output of this function can either be a list of plots
or a single faceted plot. This function takes the output of the function
\code{extract_wflw_pred()} function.
}
\examples{
library(recipes)

rec_obj <- recipe(mpg ~ ., data = mtcars)
frt_tbl <- fast_regression(
  mtcars,
  rec_obj,
  .parsnip_eng = c("lm","glm"),
  .parsnip_fns = "linear_reg"
  )

extract_wflw_pred(frt_tbl,1) |> plot_regression_predictions()
extract_wflw_pred(frt_tbl,1:nrow(frt_tbl)) |>
  plot_regression_predictions(.output = "facet")

}
\seealso{
Other Plotting: 
\code{\link{plot_regression_residuals}()}
}
\author{
Steven P. Sanderson II, MPH
}
\concept{Plotting}
