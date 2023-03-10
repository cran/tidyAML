#' Generate Model Specification calls to `parsnip`
#'
#' @family Model_Generator
#'
#' @author Steven P. Sanderson II, MPH
#'
#' @details Creates a list/tibble of parsnip model specifications. With this function
#' you can generate a list/tibble output of any model specification and engine you
#' choose that is supported by the `parsnip` ecosystem.
#'
#' @description Creates a list/tibble of parsnip model specifications.
#'
#' @param .parsnip_fns The input must be a list. The default for this is set to `all`. This means that all
#' of the parsnip __linear regression__ functions will be used, for example `linear_reg()`,
#' or `cubist_rules`. You can also choose to pass a c() vector like `c("linear_reg","cubist_rules")`
#' @param .parsnip_eng The input must be a list. The default for this is set to `all`. This means that all
#' of the parsnip __linear regression engines__ will be used, for example `lm`, or
#' `glm`. You can also choose to pass a c() vector like `c('lm', 'glm')`
#' @param .mode The input must be a list. The default is 'regression'
#' @param .return_tibble The default is TRUE. FALSE will return a list object.
#'
#' @examples
#' create_model_spec(
#'  .parsnip_eng = list("lm","glm","glmnet","cubist"),
#'  .parsnip_fns = list(
#'       rep(
#'         "linear_reg", 3),
#'         "cubist_rules"
#'      )
#'  )
#'
#' create_model_spec(
#'  .parsnip_eng = list("lm","glm","glmnet","cubist"),
#'  .parsnip_fns = list(
#'       rep(
#'         "linear_reg", 3),
#'         "cubist_rules"
#'      ),
#'  .return_tibble = FALSE
#'  )
#'
#' @return
#' A list or a tibble.
#'
#' @name create_model_spec
NULL

#' @export
#' @rdname create_model_spec

create_model_spec <- function(.parsnip_eng = list("lm"),
                              .mode = list("regression"),
                              .parsnip_fns = list("linear_reg"),
                              .return_tibble = TRUE) {

  # Tidyeval ----
  engine <- .parsnip_eng%>%
    purrr::flatten_chr() %>%
    as.list()
  mode <- .mode %>%
    purrr::flatten_chr() %>%
    as.list()
  call <- .parsnip_fns %>%
    purrr::flatten_chr() %>%
    as.list()
  ret_tibble <- as.logical(.return_tibble)

  # Make Model list for purrr call
  model_spec_list <- list(
    call,
    engine,
    mode
  )

  # Use purrr pmap to make mode specs
  models <- purrr::pmap(
    .l = model_spec_list,
    .f = function(call, engine, mode) {
      match.fun(call)(engine = engine, mode = mode)
    }
  )

  # Return ----
  models_list <- list(
    .parsnip_engine = engine,
    .parsnip_mode = mode,
    .parsnip_fns = call,
    .model_spec = models
  )

  ret_tbl <- dplyr::tibble(
    .parsnip_engine = unlist(engine),
    .parsnip_mode   = unlist(mode),
    .parsnip_fns    = unlist(call),
    .model_spec     = models
  )

  ifelse(ret_tibble, return(ret_tbl), return(models_list))
}
