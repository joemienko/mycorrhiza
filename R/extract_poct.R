#' Extract token from Sprout sign-in GET response
#'
#' @param response A response from a GET to one of the oliver Sign-in Domains containing a "poc.t" cookie.
#'
#' @return
#' @export
#'
#' @examples
extract_poct <- function(response) {
  
  dat_cookies <- httr::cookies(response)
  
  if ("poc.t" %in% dat_cookies$name) {
    return(dat_cookies[dat_cookies$name == "poc.t","value"])
  } else {
    stop(
      "No poc.t cookie found"
      ,call. = FALSE
    )
  }
}
