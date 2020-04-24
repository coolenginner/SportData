library(tidyr)
library(dplyr)
library(knitr)
#library(ggrepel)

f <-"https://github.com/coolenginner/SportData/blob/master/rankings/rankings_2020-03-08.csv"

all_rankings <- read.csv(f) %>%
  mutate(elastic_ranking=min_rank(-season_win_rate),
         predict_ranking=min_rank(-pred_win_rate_538),
         absdiff=ifelse(abs(elastic_ranking-predict_ranking)>4, 0, 1)) %>%
  select(team, conference, division, elastic_ranking, predict_ranking, absdiff) %>%
  arrange(elastic_ranking)

kable(select(all_rankings, conference, division, team, elastic_ranking, predict_ranking))

#ggplot(all_rankings, aes(x=elastic_ranking, y=predict_ranking)) +
#  xlab("Elastic Ranking") + ylab("predict_ranking") +
#  geom_point(size = 2, color = 'black') + geom_smooth(method='lm') + 
#  geom_label_repel(aes(elastic_ranking, predict_ranking, label = team, fill=factor(absdiff)),
#                   fontface = 'bold', color = 'white', size=2,
#                   box.padding = unit(0.35, "lines"),
#                   point.padding = unit(0.5, "lines")) + 
#  theme(legend.title = element_blank()) + theme(legend.position="none")

