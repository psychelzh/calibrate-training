##' Calculate difficulty for all the games
##'
##' Calculation is separated by set. And in addition to difficulty, sample size
##' and standard error are also calculated.
##'
##' @title
##' @param data
##' @return A `tibble` of all the required variables.
##' @author Liang Zhang
##' @export
calc_difficulty <- function(data) {
  bind_rows(`2` = data, `3` = data, .id = "star_crit") %>%
    group_by(star_crit, set, user_id, game_name, game_stage) %>%
    summarise(
      rate_pass = sum(game_star >= star_crit) / n(),
      .groups = "drop"
    ) %>%
    group_by(set, game_name, game_stage) %>%
    summarise(n = n(), mean_se(rate_pass), .groups = "drop")
}
