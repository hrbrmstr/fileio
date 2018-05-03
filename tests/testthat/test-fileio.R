context("post a file")
test_that("we can post a file", {

  x <- fi_post_file(system.file("extdat", "tst.txt", package = "fileio"), expires = "1d")

  expect_true(x$success)

  tmp <- readLines(con <- url(x$link), warn = FALSE)
  close(con)

  expect_equal(tmp, "Hi Noam!")


})

context("post text")
test_that("we can post text", {

  x <- fi_post_text("Hi Noam!", expires = "1d")

  expect_true(x$success)

  tmp <- readLines(con <- url(x$link), warn = FALSE)
  close(con)

  expect_equal(tmp, "Hi Noam!")

})

context("post arbitrary R data")
test_that("we can post arbitrary R data", {

  fi_post_rdata(
    list(
      mtcars = mtcars,
      iris = iris,
      message = "Hi Noam!"
    ),
    expires = "1d"
  ) -> x

  expect_true(x$success)

  tmp <- readRDS(con <- url(x$link))
  close(con)

  expect_true(all(names(tmp) %in% c("iris", "message", "mtcars")))

})

