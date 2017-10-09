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
#' @export
my_filter <- function(x, args) {
  dplyr::filter(x, !!dplyr::enquo(args))
} 
