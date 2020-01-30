library(mycorrhiza)

test_that("extract_poct() fails if poc.t is missing", {
  # non sprout url
  expect_error(extract_poct(httr::GET("http://www.google.com"))
               ,"No poc.t cookie found"
  )
})

test_that("extract_poct() returns character vector containing cookie", {
  # sprout url
  expect_type(extract_poct(httr::GET("https://www.sproutservices.org/sign-in"))
               ,"character"
  )

  expect_equal(nchar(extract_poct(httr::GET("https://www.sproutservices.org/sign-in")))
              ,36
  )

})


