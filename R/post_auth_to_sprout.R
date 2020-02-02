#' Authenticate to the Sprout API
#'
#' @param email An email registered with the Sprout application.
#' @param password A password associated with `email`.
#' @param env The desired API environment.
#' @param user_dat A boolean indicating whether or not the user wants session information
#'   returned from the function.
#'
#' @return
#' @export
#'
#' @examples
post_auth_to_sprout <- function(email=NULL, password=NULL, env=NULL, user_dat=FALSE) {

  base_url <- return_subdomain(env)

  if (is.null(email) | is.null(password)) {
    stop("Please specify an email and password registered with www.sproutservices.org",
         call. = FALSE)
  }

  info_url <- httr::modify_url(base_url
                               ,path = "sign-in")

  session_url <- httr::modify_url(base_url
                                  ,path = "api/sessions")

  info_res <- httr::GET(info_url)

  check_for_200(info_res)

  poc_t <- extract_poct(info_res)

  session_res <- httr::POST(session_url
                            ,encode = "json"
                            ,query = list(email=email
                                          ,password=password)
                            ,httr::add_headers("x-csrf-token" = poc_t))

  check_for_200(session_res)

  if (user_dat) {

    authentication_objects <- list(info = info_res
                                   ,session = session_res
                                   ,base = base_url)

    return(authentication_objects)

  } else {

    message("Authentication Successful")

  }

}
