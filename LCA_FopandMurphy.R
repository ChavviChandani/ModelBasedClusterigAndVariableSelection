print("Fop and Murphy Code starting")
#Reading csv file
library(readr)
Learner_Pattern_Anon <- read_csv("Learner_Pattern_Anon.csv")
# View(Learner_Pattern_Anon)

#Importing csv to dataframe 
library(rio)
Learner_Pattern_Anon_df <- import("Learner_Pattern_Anon.csv")

# no global independence and swap-stepwise search - Fop, Smart, Murphy (2017)
library(LCAvarsel)
lcavslswap <- LCAvarsel(Learner_Pattern_Anon_df, G = 5, swap = TRUE, parallel = TRUE)
saveRDS(lcavslswap, file = "/users/pgrad/chandanc/Desktop/Chavvi_RCode/VariableSelection/FopandMurphy.rds")

plot(best_fit, which = 1:4)

plot(fit8, which = 1:6)

plot(LCA_variableSelection_DeanAndRaftery, which = 1:5)
