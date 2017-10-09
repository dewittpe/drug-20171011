#' My Summary
#'
#' A simple function for summarizing a data set.
#'
#' @param x a data.frame
#' @param args the filtering conditions
#'
#' @return a data.frame
#' 
#' @examples
#'
#' v1 <- dplyr::filter(mtcars, mpg < 14)
#' v2 <- my_filter(mtcars, mpg < 14)
#' 
#' if (!all.equal(v1, v2)) {
#'   stop("my_filter is broken", call. = FALSE)
#' }
#'
#' v3 <- dplyr::filter(mtcars, mpg < 14 & hp > 220)
#' v4 <- my_filter(mtcars, mpg < 14 & hp > 220)
#' 
#' if (!all.equal(v3, v4)) {
#'   stop("my_filter is broken", call. = FALSE)
#' }
#'
#' @export
my_filter <- function(x, args) {
  dplyr::filter(x, rlang::UQ(dplyr::enquo(args)))
} 


# NOTE: An equvialent function would use !!, a short hand for rlang::UQ.
#       Read the vignette, it *might* be preferable to use UQ in packages as UQ
#       is more robust than !!.
# my_filter <- function(x, args) {
#   dplyr::filter(x, !!(dplyr::enquo(args)))
# } 

# TODO:  What if you want to use an unknown number of arguments, i.e., use ...
# instead of args?
