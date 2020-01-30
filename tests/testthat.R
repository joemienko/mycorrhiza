library(testthat)
library(mycorrhiza)

readRenviron("~/.Renviron")

test_check("mycorrhiza")
