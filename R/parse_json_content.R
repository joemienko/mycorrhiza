#' Parse JSON content obtained from the Sprout API
#'
#' @param session_obj A session object, most likely a list returned from
#'    `post_auth_to_sprout()`.
#'
#' @return
#' @export
#'
#' @examples
parse_json_content <- function(session_obj){
  session_obj %>%
    httr::content() %>%
    # make json, then make list
    jsonlite::toJSON() %>%
    jsonlite::fromJSON() %>%
    # remove classification level
    purrr::flatten() %>%
    # turn nested lists into dataframes
    purrr::map_if(purrr::is_list
                  ,dplyr::as_tibble
                  ,.name_repair="minimal") %>%
    # bind_cols needs tibbles to be in lists
    purrr::map_if(tibble::is_tibble
                  ,list) %>%
    # creates nested dataframe
    dplyr::bind_cols()
}
