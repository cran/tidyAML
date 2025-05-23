% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/internals-set-tune-modspec-args.R
\name{internal_set_args_to_tune}
\alias{internal_set_args_to_tune}
\title{Internals Make a Tunable Model Specification}
\usage{
internal_set_args_to_tune(.model_tbl)
}
\arguments{
\item{.model_tbl}{The model table that is generated from a function like
\code{fast_regression_parsnip_spec_tbl()}, must have a class of "tidyaml_mod_spec_tbl".}
}
\value{
A list object of workflows.
}
\description{
Make a tuned model specification object.
}
\details{
This will take a model specification that is created from a function
like \code{\link[=fast_regression_parsnip_spec_tbl]{fast_regression_parsnip_spec_tbl()}} and update the \strong{model_spec}
\code{args} to \code{tune::tune()}. This is done dynamically, meaning you do not need
to know the names of the parameters inside of the model specification.
}
\examples{
library(dplyr)

mod_tbl <- fast_regression_parsnip_spec_tbl()
mod_tbl$model_spec[[1]]

updated_mod_tbl <- mod_tbl |>
  mutate(model_spec = internal_set_args_to_tune(mod_tbl))
updated_mod_tbl$model_spec[[1]]

}
\seealso{
Other Internals: 
\code{\link{internal_make_fitted_wflw}()},
\code{\link{internal_make_spec_tbl}()},
\code{\link{internal_make_wflw}()},
\code{\link{internal_make_wflw_gee_lin_reg}()},
\code{\link{internal_make_wflw_predictions}()},
\code{\link{make_classification_base_tbl}()},
\code{\link{make_regression_base_tbl}()}
}
\author{
Steven P. Sanderson II, MPH
}
\concept{Internals}
