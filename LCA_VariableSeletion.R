## Variable Selection for Latent Class Analysis
# LCAvarsel ---------------------
# global independence assumption - Dean and Raftery (2010)
library(LCAvarsel)
ctrlLCA <- controlLCA(tol = 1e-07, nrep = 50)
LCA_variableSelection_DeanAndRaftery <- LCAvarsel(Learner_Pattern_Anon_df, G = 2:11, independence = TRUE, parallel = TRUE)
LCA_variableSelection_DeanAndRaftery
View(LCA_variableSelection_DeanAndRaftery)
LCA_variableSelection_DeanAndRaftery$variables
LCA_variableSelection_DeanAndRaftery$model$parameters$theta
LCA_variableSelection_DeanAndRaftery$model$parameters$tau


LCA_variableSelection_DeanAndRaftery$model$parameters
write_xlsx(data.frame(LCA_variableSelection_DeanAndRaftery$model$z),"dean_raftery_df.xlsx")

theta_dean <- array(simplify(LCA_variableSelection_DeanAndRaftery$model$parameters$theta), c(5, 2, 42))[, 2, ]
colnames(theta_dean) <- LCA_variableSelection_DeanAndRaftery$variables
theta_dean
write_xlsx(data.frame(theta_dean),"theta_dean_df.xlsx")


matplot(LCA_variableSelection_DeanAndRaftery$model$z)
matplot(LCA_variableSelection_DeanAndRaftery$info)
write_xlsx(data.frame(LCA_variableSelection_DeanAndRaftery$model$parameters$theta),"dean_raftery_theta_df.xlsx")


Learner_Pattern_Anon_df_DR <- Learner_Pattern_Anon_df[ -c(27:34,38,40,42,45,46,50,52,54,58)]
scatterplot3d(Learner_Pattern_Anon_df_DR)

saveRDS(LCA_variableSelection_DeanAndRaftery, file = "/Users/chavvichandani/Documents/Dissertation/Dissertation_Code_19316970/DeanandRaftery.rds")
mod <- readRDS("/Users/chavvichandani/Documents/Dissertation/Dissertation_Code_19316970/DeanandRaftery.rds")
mod$model$parameters

# Selecting the number of latent classes using BIC : To cross check
BICstore_VS <- rep(0, 10)
View(BICstore_VS)
best_fit_VS <- NULL

for(g in 2:11){
  fit_VS <- blca.em(Learner_Pattern_Anon_df_DR, G = g, start.vals = "single",restarts = 50)
  BICstore_VS[g-1] <- fit_VS$BIC
  if(g == 2){
    best_fit_VS <- fit_VS
  } else{
    if(fit_VS$BIC > best_fit_VS$BIC)
    {
      best_fit_VS <- fit_VS
    }
  }
}

View(BICstore_VS)
View(best_fit_VS)

write_xlsx(data.frame(best_fit_VS$itemprob),"dean_raftery_df.xlsx")

best_fit_VS

heatmap(theta_dean)

plot(theta_dean, which = 1:5)

