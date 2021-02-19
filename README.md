# Course materials for BIOSCI738 (semester 1, 2021)

## Copyright

All files are (C)Copyright by the University of Auckland unless explicitly stated otherwise. Distrubution without prior written permission is prohibited.

### *bluebook* [here](https://stats-uoa.github.io/BIOSCI738/)


## Contact

+ Charlotte M. Jones-Todd
  - [c.jonestodd@auckland.ac.nz](c.jonestodd@auckland.ac.nz)
  - Office 318, building 303

## Timetable

+ **Lectures** Thursday 2–4pm
+ **Labs** Friday 2–3pm

## Assessment

+ **Workshops** 5% Total (10 to complete, worth 0.5% each) Students must attend at least 7 out of the 10 workshops)
+ **Assignments** 55%  Total (5 to complete worth 10%) Each assignment will also contain a peer review aspect (worth 1%) students must complete  the peer review coursework component of the assignments to be awarded their associated peer reviewed grade
+ **Final Exam** 40% Total
+ Throughout the course there will also be the options to complete additional assignments/tasks for extra credit (capped at 5% in total)

## Key Topics

### Exploratory Data Analysis and Communication

+ Data wrangling 
+ Data visualisation

### Experimental Design and Statistical Inference

+ Introduction to design and analysis of experiments
+ Comparison procedures: pairwise comparisons of means, one-way ANOVA
+ Multiple comparison procedures (controlling errors in hypothesis testing) 
+ Multiple regression with continuous and categorical explanatory variables
+ Mixed models; incorporating fixed and random effects
+ Resampling procedures: randomisation, permutation, and bootstrapping

### Multivariate Analysis

+ Cluster analysis
+ Unsupervised learning: principal components analysis, dimension reduction
+ Ordination: multidimensional scaling, correspondence analysis
+ Supervised learning: discriminant analysis
+ Networks and graphs

## Outline

This is a postgraduate course in statistical methods geared towards the needs of students of biology, ecology, and environmental science. Whether heading to research or industry, it is imperative that biology students have the statistical and computational skills to apply and interpret fundamental statistical concepts and analyses to assess and critique their experiments and other data.

This course is suited to students with an interest in (bio)statistics who would like to equip themselves with the tools and know-how to be able to correctly prepare experiments, analyse data, interpret their results and draw valid conclusions. The statistical concepts and methods taught in this course will provide students with the tools to make and evaluate scientific discoveries as well as propose and justify decisions based on data. Some basic statistical knowledge is assumed. 

This course will use the programming language R; R is a free software environment for statistical computing and graphics. Students are strongly encouraged to use R through the freely available IDE (integrated development environment) RStudio. Students will have access to R and RStudio in university computing laboratories, but are also encouraged to download and install R and RStudio on their own devices.

### Assignments and workshops

+ There will be 10 workshops (worth 0.5% each). These will take the form of worksheets, discussions, or MCQ quizzes; each will be designed to be completed within the dedicated lab time, and will be due 5pm on each Friday (weeks 2--11)
+ There will be 5 assignments throughout the semester, each with a peer review aspect. After each assignment has been handed out students will, typically, be given 2 weeks to complete (due 5pm on the Friday 2 weeks after). Students will then be given 1 week to complete the peer review aspect of the assignment.
  - Each assignment will be based on a particular dataset and associated publication alongside the course material They will be split into, roughly, four components:
   - MCQs based on EDA of the data
   - Practical inference, using R
   - A longer form answer (e.g., CANVAS Discussion answer and/or CANVAS file upload) based on your own analysis of the data.
   - A peer review element


### Weekly overview

+ Note: week 1 will have no lecture (due to SBS field trips) and the workshop/lab will the optional. There will, however, be a week 1 only extra credit assignment available.

+ Note also: week 12 will have a required lecture, however the review workshop/lab is optional.

| Week  | Overview  | Assignment  | Assignment peer review grading | Workshop |
|---    |---        |---          |---                             |---  
|  1    | R \& RStudio catch up  | Extra Credit |  N/A    | Optional |
|  2    | Data wrangling and visualisation  |1 |  N/A    | 1 | 
|  3    | Experimental design: the roles of replication, randomisation, and blocking  |1 |  N/A    | 2 | 
|  4    | Pairwise and multiple comparison procedures   |2 |  1      | 3 |
|  5    | Resampling procedures: randomisation, permutation, and bootstrapping  |2 |  N/A    | 4 |
|  | Midterm break | | |
|  6    | Multiple regression (GLMs)  |3 |  2      | 5 |
|  7    | Mixed models; incorporating fixed and random effects  |3 |  N/A    | 6 |
|  8    | Introduction to unsupervised learning techniques (e.g., clustering techniques, dimensionality reduction)  |4 |  3      | 7 |
|  9    | Ordination (e.g., multidimensional scaling, correspondence analysis)   |4 |  N/A    | 8 |
|  10   | Introduction to supervised learning techniques (e.g., linear discriminant analysis)  |5 |  4      | 9 |
|  11   | Decision trees, k-nearest neighbour, naive Bayes  |5 |  N/A    | 10 |
|  12   | Introduction to network analysis and graphs |N/A | 5     | Optional/Review |  

### Learning Objectives

#### Week 1

+ Define the difference between R and RStudio
+ Explain what an R function is; describe what an argument to an R function is
+ Explain what an R package is; distinguish between the functions **install.packages()** and **library()**
+ Use the appropriate R function to read in a `.csv` data; carry out basic exploratory data analysis using in-built R functions


#### Week 2

+ Define data sovereignty and explain this in relation to a researcher's obligation when collecting, displaying, and analysing data
+ Create and communicate informative data visualisations using R
+ Discuss and critique data visualisations
+ Carry out, and interpret the outputs of, basic exploratory data analysis using in-built R functions
+ Communicate statistical concepts and experimental outcomes clearly using language appropriate for both a scientific and non-scientific audience

#### Week 3

+ Explain the relevance of randomisation, replication, and blocking in the context of experimental design
+ Design an effective experiment adhering to the fundamental principals of experimental design

#### Week 4

+ Perform and interpret different pairwise and multiple comparison procedures to carry out hypothesis testing (e.g., one- and two-sample t-tests, ANOVA, MANOVA).
+ Carry out and interpret post-hoc tests appropriately

#### Week 5

+ Perform and interpret different resampling techniques to carry out hypothesis testing and construct confidence intervals (e.g., randomisation tests, permutation tests, bootstrapping). Students should be able to write R code to perform each technique.

#### Week 6

+ Perform, interpret, and critique appropriate statistical regression techniques. Students should be able to write R code to fit each model.

#### Week 7

+ Distinguish and communicate the differences between fixed and random effects
+ Fit and interpret mixed models in R

#### Week 8

+ Perform and interpret cluster analysis techniques
+ Describe the differences between different distance metrics used to perform cluster analyses
+ Explain the conditions under which it is appropriate to use different methods for elucidating patterns in multivariate datasets

#### Week 9

+ Analyse and interpret multivariate data using an appropriate method (e.g., Principal Component Analysis, Cluster Analysis)
+ Carry out Principal Components Analysis (PCA) using R; visualise and interpret biplots and screeplots
+ Interpret and communicate, to both a statistical and non-statistical audience, multivariate data techniques

#### Week 10

+ Describe the commonalities and differences between PCA and Discriminant Function Analysis (DFA)
+ Perform and interpret different ordination techniques

#### Week 11

+ Describe and explain the motivation for each technique

#### Week 12

+ Create and communicate an appropriate visualisation for network data
+ Describe the motivation for network analysis. Interpret the appropriate statistical output in reference to network analysis.

## Datasets

+ [DNA methylation markers](https://github.com/STATS-UOA/BIOSCI220/blob/master/data/DNA_forensic.csv) [paper](https://www.sciencedirect.com/science/article/pii/S1872497316300461?casa_token=qPk_jTQ4H5EAAAAA:Tu4wBtVyHzRAsB_7k3uIXsTqcsVucoVi7AvN54Evrue-Bw8CmK6CHraK0mjS-G4O7XF50V_cAI0)
+ [Predator avoidance responses in lobsters](https://github.com/STATS-UOA/BIOSCI220/blob/master/data/lobster.csv)
+ [Invasive dicots and herbicide](https://datadryad.org/stash/dataset/doi:10.5061/dryad.0cfxpnvzq) [paper](https://besjournals.onlinelibrary.wiley.com/doi/abs/10.1111/1365-2664.13691)
