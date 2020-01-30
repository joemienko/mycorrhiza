library(mycorrhiza)

test_that("check_for_200() errors on not 200", {

  expect_error(check_for_200(httr::GET("https://httpstat.us/300"))
               ,"API request failed"
               ,ignore.case = TRUE)

})


test_that("check_for_200() does nothing 200", {

  expect_invisible(check_for_200(httr::GET("https://httpstat.us/200")))

})
