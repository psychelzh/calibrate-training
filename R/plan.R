the_plan <-
  drake_plan(
    ## Plan targets in here.
    data_old = get_data(
      statement = read_file(file_in("sql/training_data.sql")),
      dsn = "iquizoo-old",
      database = "azy2"
    ),
    data_old_adj = data_old %>%
      mutate(
        user_sex = recode(
          user_sex,
          `1` = "男",
          `2` = "女",
          .default = "未知"
        ),
        game_star = case_when(
          game_star == 0 ~ 1L,
          game_star == 1 ~ 2L,
          TRUE ~ game_star
        ),
        user_dob = as.character(user_dob)
      ) %>%
      mutate(across(ends_with("id"), as.character)),
    data_new = get_data(
      statement = read_file(file_in("sql/training_data_v3.sql")),
      dsn = "iquizoo-v3",
      database = "iquizoo_datacenter_db"
    ),
    data = bind_rows(
      old = data_old_adj,
      new = data_new,
      .id = "set"
    )
  )
