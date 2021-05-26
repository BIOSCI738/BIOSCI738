library(tidyverse)
library(MASS) ## for LDA
## the data
diabetes <- read_csv("diabetes.csv")
diabetes$group <- factor(diabetes$group)
diabetes
## Plots
ggplot(reshape2::melt(diabetes, id.vars = c("id", "group")),
       aes(x = value, col = group)) +
  geom_density() + facet_wrap( ~variable, ncol = 1, scales = "free") +
    theme(legend.position = "bottom")
ggplot(diabetes, mapping = aes(x = insulin, y = glutest)) +
  theme_bw() +
  geom_point(aes(colour = group), size = 3) +
  labs( x = "insulin" , y = "glutest") +
  theme(axis.title = element_text( size = 16),
        axis.text  = element_text(size = 12))
## LDA with two variables
diabetes_lda  <-  lda(group ~ insulin + glutest, data = diabetes)
## how many discriminant functions are possible? (min variables and groups)
diabetes_lda
## missclassification
ghat <- predict(diabetes_lda)$class
table(prediced = ghat, observed = diabetes$group)
mean(ghat != diabetes$group)
## predictions
diabetes.pred <- predict(diabetes_lda)
str(diabetes.pred)

### NOW what about all the variables
lda_all <- lda(group ~ insulin + glutest + glufast + steady + relwt,data = diabetes)
## confusion matrix
diabetes.full.pred <- predict(lda_all)
diabetes.full.pred
ldahist(data = diabetes.full.pred$x[,1], g = diabetes$group)

prop.table(table(predicted = diabetes.full.pred$class, observed = diabetes$group))
## leave one out cross validation
diabetes.full.pred <- predict(lda_all, CV = TRUE)
diabetes.full.pred
