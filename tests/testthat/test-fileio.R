context("post a file")
test_that("we can post a file", {

  x <- fi_post(system.file("extdat", "tst.txt", package = "fileio"))

  expect_true(x$success)

})

context("post text")
test_that("we can post text", {

  x <- fi_text("Hi Noam!")

  expect_true(x$success)

})

context("post arbitrary R data")
test_that("we can post arbitrary R data", {

  fi_data(
    list(
      mtcars = mtcars,
      iris = iris,
      message = "Hi Noam!"
    )
  ) -> x

  expect_true(x$success)

})

