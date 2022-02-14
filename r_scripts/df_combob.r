library(tidyverse)
data <- read_csv("split_plot.csv")
## DO NOT FORGET THIS
data$Animal <- as.factor(data$Animal)
data$Sample <- as.factor(data$Sample)
data
####********************######
## RCBD
## ignoring Disease (i.e., plot)
summary(aov(logAUC ~ Organ + Error(Animal), data = data))
## the blocks are the only individual animals, of which there are b = 6. 
## Within each animal we harvest two pieces of biological material 
## (ignoring for now that there are the LV/RV organ-treatments inextricably linked with them, 
## i.e. we cannot randomise organ to tissue sample just as we cannot randomise sex). 
## So there is 1df for tissue sample *within* animal (Disease).
## But, we have 6 distinct animals so that the 1df contrast associated with each animal 
## (ignoring treatments) is uncorrelated with that from the remaining 5 animals. 
## So, each animal yields this 1df, giving 6df in total
####********************######
## Split-block NOT split-plot
summary(aov(logAUC ~ Disease*Organ + Error(Animal), data = data))
