##' Fetch data
##'
##' A common interface to fetch required training data.
##'
##' @title
##' @param statement File name storing
##' @param ...
get_data <- function(statement, ...) {
  conn <- DBI::dbConnect(odbc::odbc(), ...)
  on.exit(DBI::dbDisconnect(conn))
  DBI::dbGetQuery(conn, statement) %>%
    tibble()
}
