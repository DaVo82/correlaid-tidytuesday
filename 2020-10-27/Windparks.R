# tuesdata <- tidytuesdayR::tt_load('2020-10-27')
# 
# wind_turbine <- tuesdata$wind_turbine

library(dplyr)
library(ggplot2)
library(stringr)

wind_turbine <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-10-27/wind-turbine.csv')
glimpse(wind_turbine)

ggplot(wind_turbine, aes(x=rotor_diameter_m, y=hub_height_m, color = province_territory)) +
  geom_point()

wt_height <- wind_turbine  %>%
  mutate(commissioning_date = as.numeric(str_sub(commissioning_date, start=1, end=4))) %>% 
  group_by(commissioning_date) %>%
  summarize(avg_hub_height = mean(hub_height_m))


ggplot(wt_height) +
  geom_col(aes(x = commissioning_date, y = avg_hub_height)) +
  labs(title = "Height of Wind Turbines", x = "Year", y = "Average Height (m)") +
  theme_classic()