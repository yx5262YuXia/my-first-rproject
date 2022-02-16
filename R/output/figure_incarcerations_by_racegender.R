read_csv(here("data/NLSY97_clean.csv")) %>%
  group_by(race, gender) %>%
  summarize(total_incarcerations = mean(total_incarcerations)) %>%
  ggplot(aes(race, total_incarcerations, fill = gender)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    x = "Race", 
    y = "Mean Incarceration Time", 
    fill = "Gender",
    title = "Mean Incarceration Time in 2002 by Race and Gender") +
  theme_minimal() +
  scale_fill_economist()

ggsave(here("figures/incarcerations_by_racegender.png"), width=8, height=4.5)
