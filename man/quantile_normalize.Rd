% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils-quantile-normalize.R
\name{quantile_normalize}
\alias{quantile_normalize}
\title{Perform quantile normalization on a numeric matrix/data.frame}
\usage{
quantile_normalize(.data, .return_tibble = FALSE)
}
\arguments{
\item{.data}{A numeric matrix where each column represents a sample.}

\item{.return_tibble}{A logical value that determines if the output should be a tibble. Default is 'FALSE'.}
}
\value{
A list object that has the following:
\enumerate{
\item A numeric matrix that has been quantile normalized.
\item The row means of the quantile normalized matrix.
\item The sorted data
\item The ranked indices
}
}
\description{
This function will perform quantile normalization on two or more
distributions of equal length. Quantile normalization is a technique used to make the distribution of values across different samples
more similar. It ensures that the distributions of values for each sample have the same quantiles.
This function takes a numeric matrix as input and returns a quantile-normalized matrix.
}
\details{
This function performs quantile normalization on a numeric matrix by following these steps:
\enumerate{
\item Sort each column of the input matrix.
\item Calculate the mean of each row across the sorted columns.
\item Replace each column's sorted values with the row means.
\item Unsort the columns to their original order.
}
}
\examples{
# Create a sample numeric matrix
data <- matrix(rnorm(20), ncol = 4)

# Perform quantile normalization
normalized_data <- quantile_normalize(data)
normalized_data

as.data.frame(normalized_data$normalized_data) |>
  sapply(function(x) quantile(x, probs = seq(0, 1, 1 / 4)))

quantile_normalize(data, .return_tibble = TRUE)

}
\seealso{
\code{\link{rowMeans}}: Calculate row means.

\code{\link{apply}}: Apply a function over the margins of an array.

\code{\link{order}}: Order the elements of a vector.

Other Utility: 
\code{\link{check_duplicate_rows}()},
\code{\link{core_packages}()},
\code{\link{create_splits}()},
\code{\link{create_workflow_set}()},
\code{\link{fast_classification_parsnip_spec_tbl}()},
\code{\link{fast_regression_parsnip_spec_tbl}()},
\code{\link{full_internal_make_wflw}()},
\code{\link{install_deps}()},
\code{\link{load_deps}()},
\code{\link{match_args}()}
}
\author{
Steven P. Sanderson II, MPH
}
\concept{Utility}
