#' Get authenticated user information from the Sprout API
#'
#' @description This is essentially a configuration file for the columns needing
#'    needing to be selected from the user session object.
#'
#' @param user_data A `tbl``, most likely returned from
#'    `post_auth_to_sprout()`, and then processed with `parse_json_content()`.
#'
#' @return
#' @export
#'
#' @examples
get_user_info <- function(user_data) {

  user_data %>%
    dplyr::select(id_user = id, tx_org_name = name, orgAdminsCanManageOwnReferrals,
           routingOrg, readOnlyWithinRegion, id_org = id1,
           tx_user_name = fullName, organizationAdmin, superAdmin,
           canManageReferrals, activatedAt, regionAdmin) %>%
    as_tibble()

}

