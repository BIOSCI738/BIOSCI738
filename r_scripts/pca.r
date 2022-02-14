require(tidyverse)
require(palmerpenguins)
## getting rid of NAs
penguins_nafree <- penguins %>% drop_na()
## correlation
## numeric values
pen_num <- penguins_nafree %>%
                   dplyr::select(where(is.numeric),- year)
corrplot::corrplot(cor(pen_num), method = "ellipse", type = "upper")
## pairs plot
require(GGally)
pen_num %>%
  ggpairs(columns = c("flipper_length_mm", "body_mass_g", 
                      "bill_length_mm", "bill_depth_mm"))
## pca
pca <-pen_num %>%
  scale() %>%
  prcomp()
summary(pca)
## summary
require(factoextra)
fviz_pca_biplot(pca, geom = "point") +
    geom_point (alpha = 0.2)
## other info
fviz_pca_biplot(pca, geom = "point",alpha = 0.2) +
    geom_point (aes(color = penguins_nafree$species))

## screeplot of sdev^2
fviz_screeplot(pca, choice = "eigenvalue") +
  geom_hline(yintercept = 1)
