## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE---------------------------------------------------------------
#  install.packages("tidyAML")

## ----warning=FALSE, message=FALSE, eval=FALSE---------------------------------
#  # install.packages("devtools")
#  devtools::install_github("spsanderson/tidyAML")

## ----example------------------------------------------------------------------
library(tidyAML)

## -----------------------------------------------------------------------------
fast_regression_parsnip_spec_tbl(.parsnip_fns = "linear_reg")
fast_regression_parsnip_spec_tbl(.parsnip_eng = c("lm","glm"))
fast_regression_parsnip_spec_tbl(.parsnip_eng = c("lm","glm","gee"), 
                                 .parsnip_fns = "linear_reg")

## -----------------------------------------------------------------------------
class(fast_regression_parsnip_spec_tbl())

## -----------------------------------------------------------------------------
create_model_spec(
 .parsnip_eng = list("lm","glm","glmnet","cubist"),
 .parsnip_fns = list(
      "linear_reg",
      "linear_reg",
      "linear_reg",
      "cubist_rules"
     )
 )

create_model_spec(
 .parsnip_eng = list("lm","glm","glmnet","cubist"),
 .parsnip_fns = list(
      "linear_reg",
      "linear_reg",
      "linear_reg",
      "cubist_rules"
     ),
 .return_tibble = FALSE
 )

## ----warning=FALSE, message=FALSE---------------------------------------------
library(recipes)
library(dplyr)

rec_obj <- recipe(mpg ~ ., data = mtcars)
frt_tbl <- fast_regression(
  .data = mtcars, 
  .rec_obj = rec_obj, 
  .parsnip_eng = c("lm","glm"),
  .parsnip_fns = "linear_reg"
)

glimpse(frt_tbl)

## -----------------------------------------------------------------------------
frt_tbl$pred_wflw

