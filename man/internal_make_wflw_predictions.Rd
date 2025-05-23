% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/internals-make-preds-wflw.R
\name{internal_make_wflw_predictions}
\alias{internal_make_wflw_predictions}
\title{Internals Safely Make Predictions on a Fitted Workflow from Model Spec tibble}
\usage{
internal_make_wflw_predictions(.model_tbl, .splits_obj)
}
\arguments{
\item{.model_tbl}{The model table that is generated from a function like
\code{fast_regression_parsnip_spec_tbl()}, must have a class of "tidyaml_mod_spec_tbl".
This is meant to be used after the function \code{internal_make_fitted_wflw()} has been
run and the tibble has been saved.}

\item{.splits_obj}{The splits object from the auto_ml function. It is internal
to the \code{auto_ml_} function.}
}
\value{
A list object tibble of the outcome variable and it's values along with the
testing and training predictions in a single tibble.\tabular{lll}{
   .data_category \tab .data_type \tab .value \cr
   actual \tab actual \tab 21.0 \cr
   actual \tab actual \tab 21.0 \cr
   actual \tab actual \tab 22.8 \cr
   ... \tab ... \tab ... \cr
   predicted \tab training \tab 21.0 \cr
   ... \tab ... \tab ... \cr
   predicted \tab training \tab 21.0 \cr
}
}
\description{
Safely Make predictions on a fitted workflow from a model spec tibble.
}
\details{
Create predictions on a fitted \code{parnsip} model from a \code{workflow} object.
}
\examples{
library(recipes, quietly = TRUE)

mod_spec_tbl <- fast_regression_parsnip_spec_tbl(
  .parsnip_eng = c("lm","glm"),
  .parsnip_fns = "linear_reg"
)

rec_obj <- recipe(mpg ~ ., data = mtcars)
splits_obj <- create_splits(mtcars, "initial_split")

mod_tbl <- mod_spec_tbl |>
  mutate(wflw = full_internal_make_wflw(mod_spec_tbl, rec_obj))

mod_fitted_tbl <- mod_tbl |>
  mutate(fitted_wflw = internal_make_fitted_wflw(mod_tbl, splits_obj))

internal_make_wflw_predictions(mod_fitted_tbl, splits_obj)

}
\seealso{
Other Internals: 
\code{\link{internal_make_fitted_wflw}()},
\code{\link{internal_make_spec_tbl}()},
\code{\link{internal_make_wflw}()},
\code{\link{internal_make_wflw_gee_lin_reg}()},
\code{\link{internal_set_args_to_tune}()},
\code{\link{make_classification_base_tbl}()},
\code{\link{make_regression_base_tbl}()}
}
\author{
Steven P. Sanderson II, MPH
}
\concept{Internals}
