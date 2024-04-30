#' @import reticulate
NULL
#' @export
brainflow_python <- NULL
#' @export
np <- NULL
#' @export
pandas <- NULL
sys <- NULL
type_map <- NULL
.onLoad <- function (libname, pkgname)
{
  brainflow_python <<- reticulate::import ('brainflow', delay_load = TRUE)
  np <<- reticulate::import ('numpy', delay_load = TRUE)
  pandas <<- reticulate::import ('pandas', delay_load = TRUE)
  sys <<- reticulate::import ('sys', delay_load = TRUE)
  type_map <<- function (type)
  {
    if (is.character (type))
    {
      return (list (
        'float32' = np$float32,
        'float64' = np$float64,
        'auto' = NULL
      )[[type]])
    }
    type
  }
}
