#' Post an R object to file.io
#'
#' This will take an R object (which can be a list of serializable objects) and
#' create an RDS file from it and send it off to file.io.
#'
#' @md
#' @param robj an R object
#' @param filename if not provided [uuid::UUIDgenerate()] will be used to
#'        create a file and that will be returned in the result data frame
#' @param expires defaults to 14 days (`14d`). Must be a positive integer which,
#'        by default, represents the number of days until the file will be deleted.
#'        If you follow it with `w`, it will be the number of weeks; `m` for months;
#'        and, `y` for years.
#' @return a data frame (tibble) with the success status, download key, download link
#'         and expiry
#' @note There is a 5GB per file limit for the free version.
#' @export
#' @references <https://www.file.io/>
#' @examples
#' fi_post_rdata(
#'   list(
#'     mtcars = mtcars,
#'     iris = iris,
#'     message = "Hi Noam!"
#'   )
#' ) -> x
#'
#' tmp <- readRDS(con <- url(x$link))
#' close(con)
fi_post_rdata <- function(robj, filename = uuid::UUIDgenerate(), expires = "14d") {

  if (!grepl("[[:digit:]]+[wdmy]", expires[1])) {
    stop("'expires' must be either an integer or an integer followed by one of [dwmy]")
  }

  tf <- tempfile(filename, fileext = ".rds")
  on.exit(unlink(tf))

  saveRDS(robj, file = tf)

  httr::POST(
    url = "https://file.io",
    encode = "multipart",
    body = list(file = httr::upload_file(tf)),
    httr::user_agent(FILEIO_USER_AGENT)
  ) -> res

  httr::stop_for_status(res)

  res <- httr::content(res)

  res <- as.data.frame(res, stringsAsFactors = FALSE)

  class(res) <- c("tbl_df", "tbl", "data.frame")

  res$filename <- basename(tf)

  res

}

#' @noRd
#' @export
fi_data <- fi_post_rdata
