% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/internals-full-make-wflw.R
\name{full_internal_make_wflw}
\alias{full_internal_make_wflw}
\title{Full Internal Workflow for Model and Recipe}
\usage{
full_internal_make_wflw(.model_tbl, .rec_obj)
}
\arguments{
\item{.model_tbl}{A model specification table (\code{tidyaml_mod_spec_tbl}).}

\item{.rec_obj}{A recipe object.}
}
\value{
The function returns a workflow object for the first model-recipe pair based on the internal function selected.
}
\description{
This function creates a full internal workflow for a model and
recipe combination.
}
\details{
The function checks if the input model specification table inherits
the class 'tidyaml_mod_spec_tbl'. It then manipulates the input table, making
adjustments for factors and creating a list of grouped models. For each
model-recipe pair, it uses the appropriate internal function based on the
model type to create a workflow object. The specific internal function is
selected using a switch statement based on the class of the model.
}
\examples{
library(dplyr)
library(recipes)

rec_obj <- recipe(mpg ~ ., data = mtcars)

mod_tbl <- make_regression_base_tbl()
mod_tbl <- mod_tbl |>
  filter(
    .parsnip_engine \%in\% c("lm", "glm") &
    .parsnip_fns == "linear_reg"
    )
class(mod_tbl) <- c("tidyaml_mod_spec_tbl", class(mod_tbl))
mod_spec_tbl <- internal_make_spec_tbl(mod_tbl)
result <- full_internal_make_wflw(mod_spec_tbl, rec_obj)
result

}
\seealso{
Other Utility: 
\code{\link{check_duplicate_rows}()},
\code{\link{core_packages}()},
\code{\link{create_splits}()},
\code{\link{create_workflow_set}()},
\code{\link{fast_classification_parsnip_spec_tbl}()},
\code{\link{fast_regression_parsnip_spec_tbl}()},
\code{\link{install_deps}()},
\code{\link{load_deps}()},
\code{\link{match_args}()},
\code{\link{quantile_normalize}()}
}
\author{
Steven P. Sanderson II, MPH
}
\concept{Utility}
