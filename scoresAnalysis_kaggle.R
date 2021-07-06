setwd("/Users/loey/Desktop/Research/FakeNews/Lede")
library(tidyverse)

scoredf <- read_csv("scoredTitles.csv")

glimpse(scoredf)

scoredf <- scoredf %>%
  mutate(type = as.factor(type))

scoredf %>%
  mutate(type = ifelse(type == "fake", "Fake News", "True News")) %>%
  ggplot(aes(x=type, y=-score, fill=type)) +
  geom_violin() +
  geom_point(stat="summary") +
  scale_y_continuous("Surprisal of Title") +
  scale_x_discrete("") +
  scale_fill_manual(values=c("red", "green")) +
  guides(fill=F) +
  theme_minimal() +
  theme(axis.text = element_text(size = 12),
        axis.title.y = element_text(size = 16))
ggsave("img/surprisal_title.png")


scoredf %>%
  mutate(subject = ifelse(subject == "politicsNews", "politics", subject),
         type = ifelse(type == "fake", "Fake News", "True News")) %>%
  filter(subject == "politics") %>%
  ggplot(aes(x=type, y=-score, fill=type)) +
  geom_violin() +
  geom_point(stat="summary") +
  facet_wrap(~subject) +
  scale_y_continuous("Surprisal of Title") +
  scale_x_discrete("") +
  scale_fill_manual(values=c("red", "green")) +
  guides(fill=F) +
  theme_minimal() +
  theme(axis.text = element_text(size = 12),
        axis.title.y = element_text(size = 16))
