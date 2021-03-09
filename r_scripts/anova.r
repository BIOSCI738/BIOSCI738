library(tidyverse) ## load packages
rats <- read_csv("crd_rats_data.csv") ## read in data
## inspect data
rats
## calculate mean response by treatment group
rats %>%
  group_by(Surgery) %>%
  summarise(avg = mean(logAUC))
## fit a linear model
rats_lm <- lm(logAUC ~ Surgery, data = rats)
## carry out "one-way ANOVA"
lm_anova <- anova(rats_lm)
## print results (F-table)
lm_anova
## carry out "one-way ANOVA"
rats_aov <- aov(logAUC ~ Surgery, data = rats)
## print results (F-table)
rats_aov
## BOTH THE SMAE
## but what about pairwise comparisons?
## print out estimated coefficients & associated STDs and hypothesis results
summary(rats_lm)$coef

