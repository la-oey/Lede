setwd("/Users/loey/Desktop/Research/FakeNews/Lede")
library(tidyverse)

fake <- read_csv("Fake.csv") %>%
  mutate(type = "fake")
true <- read_csv("True.csv") %>%
  mutate(type = "true")

allnews <- bind_rows(fake, true)

write_csv(allnews, "News.csv")
