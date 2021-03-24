library(tidyverse)
factorial <- read_csv("factorial_expt.csv")
glimpse(factorial)
## change to factors (saves errors with predictmeans and as we saw before with lm)
factorial$Disease <- as.factor(factorial$Disease)
factorial$Organ <- as.factor(factorial$Organ)
## shorthand version
fac_lm <- lm(logAUC ~ Disease*Organ, data = factorial)
## longhand version
fac_lm_lh <- lm(logAUC ~ Disease + Organ +Disease:Organ, data = factorial)
## both are the SAME
cbind("short hand" = coef(fac_lm),"long hand" = coef(fac_lm_lh))
## summary lm
anova(fac_lm)
## balanced design so ordering doesn't matter
fac_lm <- lm(logAUC ~ Disease*Organ, data = factorial)
anova(fac_lm)
fac_lm_2 <- lm(logAUC ~ Organ*Disease, data = factorial)
anova(fac_lm_2)
## Unbalanced design
## unequal repliction
## let's make our design unequl
unbalanced <- factorial
unbalanced$logAUC[c(1:3,10)] <- NA
unbalanced_nafree <- unbalanced %>% drop_na()
## order matters
fac_lm <- lm(logAUC ~ Disease*Organ, data = unbalanced_nafree)
anova(fac_lm)
fac_lm_2 <- lm(logAUC ~ Organ*Disease, data = unbalanced_nafree)
anova(fac_lm_2)
