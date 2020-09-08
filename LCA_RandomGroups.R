# LCA model implementation
library(BayesLCA)
set.seed(123)

library("writexl")
#Fitting the EM LCA model to Learner_Pattern_Anon_df with default restart = 5
fit1 <- blca.em(Learner_Pattern_Anon_df, G = 6, verbose = FALSE)
fit1
View(fit1)
write_xlsx(data.frame(fit1$itemprob),"fit1_df.xlsx")



#Fitting the EM LCA model to Learner_Pattern_Anon_df with restart = 20
fit2 <- blca.em(Learner_Pattern_Anon_df, G = 6, restart = 20)
fit2
View(fit2)
write_xlsx(data.frame(fit2$itemprob),"fit2_df.xlsx")


#Fitting the EM LCA model to Learner_Pattern_Anon_df with restart = 50
fit3 <- blca.em(Learner_Pattern_Anon_df, G = 6, restart = 50)
fit3
View(fit3)
write_xlsx(data.frame(fit3$itemprob),"fit3_df.xlsx")


c(fit1$logpost, fit2$logpost, fit3$logpost)

c(fit1$BIC, fit2$BIC, fit3$BIC)



#Fitting the EM LCA model to Learner_Pattern_Anon_df with restart = 100
#fit5 <- blca.em(Learner_Pattern_Anon_df, G = 6, restart = 100)
#fit5
#View(fit5)

#Fitting the EM LCA model to Learner_Pattern_Anon_df with default restart = 5
#fit6 <- blca.em(Learner_Pattern_Anon_df, G = 6)
#fit6
#View(fit6)

#Fitting the EM LCA model to Learner_Pattern_Anon_df with restart = 50 and start.vals="across"
fit7 <- blca.em(Learner_Pattern_Anon_df, G = 6, start.vals = "across", restarts = 50)
fit7
View(fit7)
write_xlsx(data.frame(fit7$itemprob),"fit7_df.xlsx")


#Fitting the EM LCA model to Learner_Pattern_Anon_df with restart = 50 and start.vals="single"
# This is done to select random starting values
fit8 <- blca.em(Learner_Pattern_Anon_df, G = 6, start.vals = "single", restarts = 50)
fit8
View(fit8)
write_xlsx(data.frame(fit8$itemprob),"fit8_df.xlsx")


# c(fit7$logpost, fit8$logpost)

# Fitting the EM LCA model to Learner_Pattern_Anon_df start.vals="single"
fit9 <- blca.em(Learner_Pattern_Anon_df, G = 6, start.vals = "single")
fit9
View(fit9)
write_xlsx(data.frame(fit9$itemprob),"fit9_df.xlsx")


fit10 <- blca.em(Learner_Pattern_Anon_df, G = 6, start.vals = "across")
fit10
View(fit10)
write_xlsx(data.frame(fit10$itemprob),"fit10_df.xlsx")



c(fit7$logpost, fit8$logpost, fit9$logpost, fit10$logpost)
c(fit7$BIC, fit8$BIC, fit9$BIC, fit10$BIC)


plot(sort(fit8$lpstarts), sequence(table(round(fit8$lpstarts, 2))),
      main = "Converged Values", xlab = "Log-Posterior", ylab = "Frequency")

blca.em.sd(fit8, Learner_Pattern_Anon_df)
sj3.boot <- blca.boot(Learner_Pattern_Anon_df, fit = fit8, B = 1000, relabel = TRUE)

sj3.boot <- blca.boot(Learner_Pattern_Anon_df, fit = fit8, B = 1000, relabel = TRUE)
sj3.boot

c(fit7$logpost, fit8$logpost, fit9$logpost,sj3.boot$logpost)

c(fit7$BIC, fit8$BIC, fit9$BIC,sj3.boot$BIC)
