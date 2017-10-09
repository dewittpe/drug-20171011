#' My Filter
#'
#' A wrapper around dplyr::filter to show NSE with a package.
#' 
#' @param dat a data.frame
#'
#' @return a data.frame
#'
#' @examples
#'
#' dat1 <- dplyr::data_frame(a = c(1, 2, 1, 1, 2, 1),
#'                           b = c(1, 1, 1, 2, 2, 2),
#'                           c = 1:6)
#' 
#' a <- c(0, 1, 0, 0, 0, 1)
#' b <- c(2, 2, 2, 0, 2, 2)
#' 
#' all.equal(dplyr::filter(dat1, a == 1, b == 2),
#'           my_filter(dat1))
#' 
#' @export
my_filter <- function(dat) {
  dplyr::filter(dat, .data$a == 1, .data$b == 2)
}

