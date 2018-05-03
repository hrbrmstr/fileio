#' Post a file!
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
#' @examples
#' fi_post(system.file("extdat", "tst.txt", package = "fileio"))
fi_post <- function(path, expires="14d") {

  path <- path.expand(path[1])
  path <- normalizePath(path)

  if (!file.exists(path)) stop("File not found!", call.=FALSE)

  httr::POST(
    url = "https://file.io",
    encode = "multipart",
    body = list(file=httr::upload_file(path)),
    httr::verbose()
  ) -> res

  httr::stop_for_status(res)

  res <- httr::content(res)

  res <- as.data.frame(res, stringsAsFactors=FALSE)

  class(res) <- c("tbl_df", "tbl", "data.frame")

  res

}

