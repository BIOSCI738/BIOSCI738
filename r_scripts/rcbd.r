require(tidyverse)
require(lme4)
rcbd <- read_csv("rcbd.csv")
glimpse(rcbd)
## Note: Run should be a factor otherwise some functions have a tantrum
## remember it is NOT numeric
rcbd$Run <- as.factor(rcbd$Run)
## using lm
lm_mod <- lm(logAUC8 ~ Run + Surgery, data = rcbd)
summary(lm_mod)
anova(lm_mod)
## using aov
aov_mod <- aov(logAUC8 ~ Surgery + Error(Run), data = rcbd)
summary(aov_mod)
## using lmer
lmer_mod <- lmer(logAUC8 ~ Surgery + (1|Run), data = rcbd)
summary(lmer_mod)
anova(lmer_mod)
