library(tidyverse)
ni <- read_csv("north_islands_distances.csv") %>%
    column_to_rownames(., var = "X1")
library(pheatmap)
pheatmap(ni, cluster_rows = TRUE,
         treeheight_row = 2, treeheight_col = 2,
         fontsize_row = 12, fontsize_col = 12,
         cellwidth = 26, cellheight = 26)

mds <-  cmdscale(ni, eig = TRUE)

ggplot(data.frame(PCo1 = mds$points[, 1],PCo2 = mds$points[, 2],
                                                  labs = rownames(mds$points)), 
       aes(x = PCo1, y = PCo2, label = labs)) +
  theme_bw() + 
  geom_point(size = 3, colour = "red") + 
  xlim(-400, 475) + 
  ylim(-300, 200) +
    coord_fixed() + geom_text(size = 5, hjust = 0.3, vjust = -0.5)

ggplot(data.frame(PCo1 = mds$points[, 1],PCo2 = mds$points[, 2], 
                                                    labs = rownames(mds$points)), 
       aes(x = PCo2, y = PCo1, label = labs)) +
  theme_bw() + 
  geom_point(size = 3, colour = "red") + 
  ylim(-400, 475) + 
  xlim(-350, 375) +
    coord_fixed() + geom_text(size = 5, hjust = 0.3, vjust = -0.5)

ggplot(data.frame(PCo1 = mds$points[, 1], PCo2 = -mds$points[, 2], 
                                                      labs = rownames(mds$points)), 
       aes(x = PCo2, y = PCo1, label = labs)) +
  theme_bw() + 
  geom_point(size = 3, colour = "red") + 
  ylim(-400, 475) + 
  xlim(-300, 375) +
    coord_fixed() + geom_text(size = 5, hjust = 0.3, vjust = -0.5)

## scree plot
## proportion of variance explained MDS
round(mds$eig / sum(mds$eig),2)
var <- data.frame(y = (mds$eig/sum(mds$eig))[1:5],
                  x = as.factor(paste("PCO", 1:5, sep = "")))
ggplot(var, aes(x = x, y = y)) +
    geom_bar(stat = "identity") +
    ylab("proportion of variance explained")


### CA
library(ade4)
library(factoextra)

HC.df <- as.data.frame.matrix(HairEyeColor[ , , 2])

library("gplots")
# 1. convert the data as a table
dt <- as.table(as.matrix(HC.df))
# 2. Graph
balloonplot(t(dt), main ="", xlab ="", ylab="",
            label = FALSE, show.margins = FALSE)

chisq <- chisq.test(dt)
chisq

library("FactoMineR")
res.ca <- CA(dt, graph = FALSE)
eig.val <- get_eigenvalue(res.ca)
eig.val
fviz_screeplot(res.ca, addlabels = TRUE, ylim = c(0, 90))

fviz_ca_biplot(res.ca, repel = TRUE)

# Contributions of rows to dimension 1
fviz_contrib(res.ca, choice = "col", axes = 1, top = 10)
# Contributions of rows to dimension 2
fviz_contrib(res.ca, choice = "col", axes = 2, top = 10)

## cos2

# Color by cos2 values: quality on the factor map
fviz_ca_row(res.ca, col.row = "cos2",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), 
            repel = TRUE)
fviz_ca_col(res.ca, col.col = "cos2",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), 
            repel = TRUE)


## Chris' way
coaHC <- dudi.coa(HC.df, scannf = FALSE, nf = 2)
round(100*coaHC$eig[1:3]/sum(coaHC$eig), 1)



fviz_ca_biplot(coaHC, repel = TRUE, col.col = "brown", col.row = "purple", 
labelsize = 5, pointsize = 5) + ggtitle("") + 
  theme(legend.text = element_text(size = 25),
        axis.title.x.bottom = element_text(size = 15), 
        axis.title.y.left = element_text(size = 15), 
        axis.text = element_text(size = 15)) + 
    ylim(c(-0.5,0.5))

dudi.coa(HC.df, scannf = TRUE)

fviz_ca_biplot(coaHC, 
repel = TRUE, col.col = "brown", col.row = "purple", labelsize = 5, arrows = c(TRUE,TRUE)) +
    theme(
        legend.text           = element_text(size = 25),
       axis.title.x.bottom  = element_text(size = 15), 
       axis.title.y.left        = element_text(size = 15), 
       axis.text                = element_text(size = 15)) +  
  ggtitle("") + ylim(c(-0.5,0.5))
