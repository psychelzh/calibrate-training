the_plan <-
  drake_plan(
    ## Plan targets in here.
    data_old = get_data_old(query_file = file_in("sql/training_data.sql"))
  )
