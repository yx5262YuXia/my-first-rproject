library(here)
library(stats)
library(kableExtra)
library(rlang)
library(ggthemes)
library(tidyverse)
library(janitor)
library(magrittr)
library(glue)
library(lubridate)
library(haven)
library(snakecase)
library(sandwich)
library(lmtest)
library(gganimate)
library(gapminder)
library(stargazer)
library(snakecase)
library(dplyr)
library(ggplot2)
read_csv(here("my-first-rproject/data/NLSY97_raw.csv")) %>%
  mutate(across(starts_with("E"), ~case_when(
    .x < 0   ~ NA_real_,
    .x == 99 ~ NA_real_,
    TRUE     ~ .x
  ))) %>%
  rowwise() %>%
  mutate(total_incarcerations = sum(c_across(starts_with("E")), na.rm = TRUE)) %>%
  ungroup() %>%
  
  mutate(gender = if_else(R0536300 == 1, "Male", "Female")) %>%
  
  mutate(race = case_when(
    R1482600 == 1 ~ "Black",
    R1482600 == 2 ~ "Hispanic",
    R1482600 == 3 ~ "Mixed Race (Non-Hispanic)",
    R1482600 == 4 ~ "Non-Black / Non-Hispanic",
  )) %>%
  
  select(race, gender, total_incarcerations) %>%
  
  write_csv(here("my-first-rproject/data/NLSY97_clean.csv"))