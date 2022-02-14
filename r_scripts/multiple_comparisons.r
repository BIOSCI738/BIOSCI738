library(tidyverse) ## load packages
rats <- read_csv("rats_crd_AUC.csv") ## read in data
## need to have surgery as a factor
rats$Surgery <- as.factor(rats$Surgery)
## inspect data
rats
## calculate mean response by treatment group
rats %>%
  group_by(Surgery) %>%
  summarise(avg_logAUC = mean(logAUC),avg_AUC = mean(AUC))
##***Recall***##
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

####**** Using predictmeans****####
library(predictmeans)
## print out to console (by default also produces plot)
predictmeans(rats_lm, modelterm = "Surgery",  pairwise = TRUE)

###*** Raw vs log AUC***###
raw <- ggplot(data = rats, aes(x = Surgery, y = AUC)) +
  geom_violin()
log <- ggplot(data = rats, aes(x = Surgery, y = logAUC)) +
  geom_violin()
library(patchwork) ## nice package for combining ggplots
raw | log
## see the difference!

## fit a model to the raw data
rats_lm_raw <- lm(AUC ~ Surgery, data = rats)
anova(rats_lm_raw)
## model diagnostic
## will need to install the gglm package first
gglm::gglm(rats_lm_raw)
## AHHHHH
## in compared to the log one we started with
gglm::gglm(rats_lm)

## Adjusting for multiple comparisons
## Bonferroni vs Tukey
## Tukey
tukey <- predictmeans(rats_lm , modelterm = "Surgery", adj = "tukey",pairwise = TRUE)
tukey
## bonferrnoi
bonferroni <- predictmeans(rats_lm , modelterm = "Surgery", adj = "bonferroni",pairwise = TRUE)
bonferroni
## Tukey's HSD
TukeyHSD(aov(logAUC~Surgery, data = rats))
