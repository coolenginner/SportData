library(tidyr)
library(dplyr)
library(knitr)

f <-"https://raw.githubusercontent.com/klarsen1/NBA_RANKINGS/master/rankings/rankings_2020-03-08.csv"

all_rankings <- read.csv(f) %>%
  mutate(elastic_ranking=min_rank(-season_win_rate),
         predict_ranking=min_rank(-pred_win_rate_538),
         absdiff=ifelse(abs(elastic_ranking-predict_ranking)>4, 0, 1)) %>%
  select(team, conference, division, elastic_ranking, predict_ranking, absdiff) %>%
  arrange(elastic_ranking)

kable(select(all_rankings, conference, division, team, elastic_ranking, predict_ranking))


