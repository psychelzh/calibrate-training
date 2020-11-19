##' Get data from old version database
##'
##' @title
get_data_old <- function(query_file) {
  con <- DBI::dbConnect(odbc::odbc(), "iquizoo-old", database = "azy2")
  on.exit(DBI::dbDisconnect(con))
  DBI::dbGetQuery(
    con,
    read_file(query_file)
  ) %>%
    tibble()
}
