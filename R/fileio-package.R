#' Post Files, Text or R Data to 'file.io'
#'
#' The 'file.io' <file.io> service enables ephemeral, convenient
#' and anonymous file sharing. Methods are provided to upload existing files,
#' R data objects or text messages to this service.
#'
#' @md
#' @name fileio
#' @docType package
#' @author Bob Rudis (bob@@rud.is)
#' @references [file.io privacy policy](https://www.file.io/privacy.html)
#' @importFrom httr POST upload_file user_agent stop_for_status content
#' @importFrom uuid UUIDgenerate
NULL
