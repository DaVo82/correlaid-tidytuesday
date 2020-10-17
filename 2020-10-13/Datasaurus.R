tuesdata <- tidytuesdayR::tt_load('2020-10-13')

datasaurus <- tuesdata$datasaurus

library(dplyr)
library(ggplot2)
library(gganimate)

datasaurus %>% 
  group_by(dataset) %>% 
  summarize_all(list(mean = mean, sd = sd)) 

str(datasaurus)


ggplot(filter(datasaurus, dataset=='dino'), aes(x, y, colour=-x)) +
  geom_point(size=5, alpha=0.85, shape=16) + theme_bw() +
  theme(legend.position = "none") +
  scale_color_continuous(type = "viridis")


ggplot(datasaurus, aes(x=x, y=y, colour = -x)) +
   geom_point(size=2, alpha=0.85, shape=16) +
   facet_wrap(~dataset) 
   theme_minimal()
   
ggplot(datasaurus, aes(x=x, y=y, colour = -x)) +
  geom_point(size=2, alpha=0.85, shape=16) +
  facet_grid(dataset~.) 
  theme_minimal()