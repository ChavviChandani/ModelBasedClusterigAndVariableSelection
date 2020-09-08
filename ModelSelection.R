# Selecting the number of latent classes using BIC
BICstore <- rep(0, 10)
View(BICstore)
best_fit <- NULL

for(g in 2:11){
  fit <- blca.em(Learner_Pattern_Anon_df, G = g, start.vals = "single", restarts = 50)
  BICstore[g-1] <- fit$BIC
  if(g == 2){
    best_fit <- fit
  } else{
    if(fit$BIC > best_fit$BIC){
      best_fit <- fit
    }
  }
}

write_xlsx(data.frame(BICstore),"BICStore.xlsx")

plot(2:11, BICstore,  type="b", col="red", main = "Groups VS BIC Values",  xlab = "Groups",ylab = "BIC Values")

best_fit #5 Groups
View(BICstore) # -31826.98
best_fit$BIC # -31826.98
write_xlsx(data.frame(best_fit$itemprob),"best_fit_df.xlsx")
