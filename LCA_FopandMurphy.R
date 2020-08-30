#Reading csv file
library(readr)
Learner_Pattern_Anon <- read_csv("Learner_Pattern_Anon.csv")
View(Learner_Pattern_Anon)

#Importing csv to dataframe 
library(rio)
Learner_Pattern_Anon_df <- import("Learner_Pattern_Anon.csv")

# no global independence and swap-stepwise search - Fop, Smart, Murphy (2017)
library(LCAvarsel)
lcavslswap <- LCAvarsel(Learner_Pattern_Anon_df, G = 5, swap = TRUE, parallel = TRUE)
lcavslswap
