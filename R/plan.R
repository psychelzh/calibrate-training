the_plan <-
  drake_plan(
    ## Plan targets in here.
    data_old = get_data(
      statement = read_file(file_in("sql/training_data.sql")),
      dsn = "iquizoo-old",
      database = "azy2"
    ),
    data_new = get_data(
      statement = read_file(file_in("sql/training_data_v3.sql")),
      dsn = "iquizoo-v3",
      database = "iquizoo_datacenter_db"
    )
  )
