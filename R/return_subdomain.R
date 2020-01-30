#' Define an Sprout subdomain to serve as a base url
#'
#' @param env A character string representing the desired API environment: 'production', 'usertest', or 'staging'.
#'
#' @return
#' @export
#'
#' @examples
return_subdomain <- function(env = NULL) {
  if (any(env == "production", is.null(env))) {
    base_url <- "https://www.sproutservices.org/"
  } else if (env == "staging") {
    base_url <- "https://staging.sproutservices.org/"
  } else if (env == "usertest") {
    base_url <- "https://usertest.sproutservices.org/"
  } else {
    stop("Please specify an environment variable of 'production', 'usertest', or 'staging'",
         call. = FALSE)
  }
  base_url
}
