context("post a file")
test_that("we can post a file", {

  testthat::skip_on_cran()

  x <- fi_post_file(system.file("extdat", "tst.txt", package = "fileio"), expires = "1d")

  expect_true(x$success)

  testthat::skip_on_appveyor()
  testthat::skip_on_travis()

  con <- url(x$link)
  tmp <- readLines(con, warn = FALSE)
  close(con)

  expect_equal(tmp, "Hi Noam!")

})

context("post text")
test_that("we can post text", {

  testthat::skip_on_cran()

  x <- fi_post_text("Hi Noam!", expires = "1d")

  expect_true(x$success)

  testthat::skip_on_appveyor()
  testthat::skip_on_travis()

  con <- url(x$link)
  tmp <- readLines(con, warn = FALSE)
  close(con)

  expect_equal(tmp, "Hi Noam!")

})

context("post arbitrary R data")
test_that("we can post arbitrary R data", {

  testthat::skip_on_cran()

  fi_post_rdata(
    list(
      mtcars = mtcars,
      iris = iris,
      message = "Hi Noam!"
    ),
    expires = "1d"
  ) -> x

  testthat::skip_on_appveyor()
  testthat::skip_on_travis()

  expect_true(x$success)

  con <- url(x$link)
  tmp <- readRDS(con)
  close(con)

  expect_true(all(names(tmp) %in% c("iris", "message", "mtcars")))

})

