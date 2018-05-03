#' Post a file to file.io
#'
#' @md
#' @param path path to a file
#' @param expires defaults to 14 days (`14d`). Must be a positive integer which,
#'        by default, represents the number of days until the file will be deleted.
#'        If you follow it with `w`, it will be the number of weeks; `m` for months;
#'        and, `y` for years.
#' @return a data frame (tibble) with the success status, download key, download link
#'         and expiry
#' @export
#' @references <https://www.file.io/>
#' @note There is a 5GB per file limit for the free version.
#' @examples
#' fi_post(system.file("extdat", "tst.txt", package = "fileio"))
fi_post <- function(path, expires="14d") {

  if (!grepl("[[:digit:]]+[wdmy]", expires[1])) {
    stop("'expires' must be either an integer or an integer followed by one of [dwmy]")
  }

  path <- path.expand(path[1])
  path <- normalizePath(path)

  if (!file.exists(path)) stop("File not found!", call.=FALSE)

  httr::POST(
    url = "https://file.io",
    encode = "multipart",
    body = list(file=httr::upload_file(path)),
  ) -> res

  httr::stop_for_status(res)

  res <- httr::content(res)

  res <- as.data.frame(res, stringsAsFactors=FALSE)

  class(res) <- c("tbl_df", "tbl", "data.frame")

  res

}

