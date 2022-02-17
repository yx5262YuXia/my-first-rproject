model <- 
  read_csv(here("data/NLSY97_clean.csv")) %>%
  lm(total_incarcerations ~ race + gender, data = .)

se <- model %>% vcovHC %>% diag %>% sqrt

covariate.labels <- names(coef(model))[-1] %>% str_replace("(^race)|(^gender)", "")

stargazer(
  model,
  se = list(se),
  covariate.labels = covariate.labels,
  dep.var.labels = "Incarcerations in 2002",
  out = here("tables/regress_incarcerations_by_racegender.tex"),
  title = "Regression Output. Omitted category is Black Females.",
  label = "tab:regression"
)
