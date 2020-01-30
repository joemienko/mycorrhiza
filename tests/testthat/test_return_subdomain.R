library(mycorrhiza)

test_that("return_subdomain() produces a character vector", {
  expect_is(return_subdomain(), "character")
})

test_that("return_subdomain() only allows valid sprout environments", {

  expect_error(return_subdomain(env="foo")
                 ,"Please specify an environment variable of 'production', 'usertest', or 'staging'")

})

test_that("return_subdomain() produces valid sprout environments", {

  expect_equal(return_subdomain()
               ,"https://www.sproutservices.org/"
  )

  expect_equal(return_subdomain(env="production")
               ,"https://www.sproutservices.org/"
  )

  expect_equal(return_subdomain(env="staging")
               ,"https://staging.sproutservices.org/"
  )

  expect_equal(return_subdomain(env="usertest")
               ,"https://usertest.sproutservices.org/"
  )

})
