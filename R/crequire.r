#' A custum require function
#'
#' This function is a wrapper of the base require function that first tests if the desired package is installed, if not, installs it, and then requires it.
#' @param package Package name, is passed to require. No default
#' @param character.only Defaults to TRUE. Passed to require
#' @param repo Defaults to http://cran.us.r-project.org
#' @keywords require
#' @export
crequire <- function(package, character.only = TRUE, repos = "http://cran.us.r-project.org") {
    tryCatch(require(package = package, character.only = character.only),
             warning = function(w) {
                 install.packages(package, repos = repos)
                 require(package, character.only = TRUE)
             })
}
