library(mycorrhiza)

test_that("post_auth_to_sprout() fails on bad or missing creds", {
  # bad creds
  expect_error(post_auth_to_sprout(email = "foo"
                                   ,password = "bar")
               ,"API request failed"
  )
  # missing password
  expect_error(post_auth_to_sprout(email = "foo")
               ,"Please specify an email and password registered with www.sproutservices.org"
  )
  # missing email
  expect_error(post_auth_to_sprout(password = "bar")
               ,"Please specify an email and password registered with www.sproutservices.org"
  )
})

user_auth_objects <- post_auth_to_sprout(email = Sys.getenv("SPROUT_USER")
                                         ,password = Sys.getenv("SPROUT_PASSWORD")
                                         ,user_dat = TRUE)

test_that("post_auth_to_sprout() returns message or data on valid creds", {
  # skip if missing env variables
  skip_if(any(Sys.getenv("SPROUT_USER")==""
              ,Sys.getenv("SPROUT_PASSWORD")=="")
          ,message = "missing SPROUT_USER or SPROUT_PASSWORD environment variables, skipping auth test")

  expect_message(post_auth_to_sprout(email = Sys.getenv("SPROUT_USER")
                                   ,password = Sys.getenv("SPROUT_PASSWORD")
                                   ,user_dat = FALSE)
                  ,"Authentication Successful"
  )

  expect_type(user_auth_objects
              , type = "list"
  )


  expect_equal(length(user_auth_objects)
              ,3
  )

  expect_s3_class(user_auth_objects[[1]]
              ,"response"
  )

  expect_s3_class(user_auth_objects[[2]]
              ,"response"
  )

  expect_type(user_auth_objects[[3]]
              ,"character"
  )

})
