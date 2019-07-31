#' #' @examples
#' #' bizarro(c("abc", "def"))
#' #' bizarro(1:10)
#' #' bizarro(c(TRUE, FALSE, TRUE))
#' #'
#' #' bizarro(mtcars)
#' bizarro <- function(x) {
#'   UseMethod("bizarro")
#' }
#'
#' bizarro.character <- function(x) {
#'   str_reverse(x)
#' }
#'
#' bizarro.numeric <- function(x){
#'   -x
#' }
#'
#' bizarro.logical<-function(x){
#'   !x
#' }
#'
#' bizarro.data.frame <- function(x) {
#'   names(x) <- bizarro(names(x))
#'   x[] <- purrr::map(x, bizarro)
#'   x
#' }
#'
#' bizarro.factor<-function(x){
#'   as.character(x)%>%str_reverse()
#' }
#'
#' bizarro.default <- function(x) {
#'   stop(
#'     "Don't know how to make bizzaro <",
#'     class(x)[[1]], ">",
#'     call. = FALSE
#'   )
#' }
