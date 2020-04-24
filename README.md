# SportData

What Does the Model Actually Predict?
The model predicts the outcome of future NBA games for the current season. It does not predict the points scored, only the probability of a given team winning.

Where to Find the Model Predictions
All rankings and scores can be found in this github repo.

The easiest way to read the predictions with, for example, R is to directly read the raw CSV files: https://github.com/coolenginner/SportData/blob/master/rankings (see R examples below).

How the Model Works
The model is based on a three-step procedure:

1. Create 25 data-driven archetypes using k-means clustering based on game-level box score statistics from games prior to the season. The goal of the clustering algorithm is to minimize differences between players within clusters (in terms of offensive and defensive stats), while maximizing differences between clusters. Players are mapped to a given cluster based on their recent performance, which means that players can change archetype if their box score statistics change.
2. The winner of a given game is predicted based on team archetypes, home-court advantage, rest days, miles traveled, previous match-ups between the two teams (during that season), as well as recent win percentages.
3. Teams are ranked based on the predicted win rate for the season. Hence the ranking is schedule-dependent.
