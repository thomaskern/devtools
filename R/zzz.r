.onAttach <- function(...) {
  find_rtools()
  invisible()
}

#' Package development tools for R.
#'
#' @section Package options:
#'
#' Devtools uses the following \code{\link{options}} to configure behaviour:
#'
#' \itemize{
#'   \item \code{devtools.path}: path to use for \code{\link{dev_mode}}
#'
#'   \item \code{devtools.name}: your name, used when signing draft
#'     emails.
#'
#'   \item \code{devtools.cleandoc}: a single logical value determining whether
#'     the contents of the file{man/} directory are deleted by
#'     \code{\link{check}}
#'
#'   \item \code{devtools.install.args}: a string giving extra arguments passed
#'     to \code{R CMD install} by \code{\link{install}}.
#'
#'   \item \code{devtools.desc.author}: a string providing a default Authors@@R
#'     string to be used in new \file{DESCRIPTION}s.  Should be a R code, and
#'     look like \code{"Hadley Wickham <h.wickham@@gmail.com> [aut, ctb]"}. See
#'     \code{\link[utils]{as.person}} for more details.
#'
#'   \item \code{devtools.desc.license}: a default license string to use for
#'     new packages.
#'
#'   \item \code{devtools.desc.suggests}: a character vector listing packages to
#'     to add to suggests by defaults for new packages.
#
#'   \item \code{devtools.desc}: a named character vector listing any other
#'     extra options to add to \file{DESCRIPTION}
#'
#' }
#' @docType package
#' @name devtools
NULL

.onLoad <- function(libname, pkgname) {
  op <- options()
  op.devtools <- list(
    devtools.path = "~/R-dev",
    devtools.cleandoc = FALSE,
    devtools.install.args = "",
    devtools.name = "getOptions('devtools.name')",
    devtools.desc.author = "# getOptions('devtools.desc.author')",
    devtools.desc.license = "# getOptions('devtools.desc.license')",
    devtools.desc.suggests = NULL,
    devtools.desc = NULL,
    github.user = "hadley"
  )
  toset <- !(names(op.devtools) %in% names(op))
  if(any(toset)) options(op.devtools[toset])

  invisible()
}
