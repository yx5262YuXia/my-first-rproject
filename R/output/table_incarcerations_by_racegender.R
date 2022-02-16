read_csv(here("data/NLSY97_clean.csv")) %>%
  
  group_by(race, gender) %>%
  summarize(total_incarcerations = mean(total_incarcerations)) %>%
  
  pivot_wider(names_from = race, values_from = total_incarcerations) %>%
  
  rename_with(to_title_case) %>%
  
  kbl(
    caption = "Mean incarceration time in 2002 by Race and Gender",
    booktabs = TRUE,
    format = "latex",
    label = "tab:summarystats"
  ) %>%
  kable_styling(latex_options = c("striped", "HOLD_position")) %>%
  
  write_lines(here("tables/incarcerations_by_racegender.tex"))
