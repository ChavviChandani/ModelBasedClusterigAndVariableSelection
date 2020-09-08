#Reading csv file
library(readr)
Learner_Pattern_Anon <- read_csv("Learner_Pattern_Anon.csv")
View(Learner_Pattern_Anon)

#Importing csv to dataframe 
library(rio)
Learner_Pattern_Anon_df <- import("Learner_Pattern_Anon.csv")

# Finding mean of each column and setting it into a data frame
col_mean_df<- data.frame(colMeans(Learner_Pattern_Anon_df[sapply(Learner_Pattern_Anon_df, is.numeric)])) 
View(col_mean_df)

# Extracing name of columns from col_mean_df dataframe 
colnames(col_mean_df)

# Changing cloumn name of col_mean_df dataframe to mean
names(col_mean_df)[1] <- "mean"

# Transposing col_mean_df dataframe 
trans_col_mean_df <- data.frame(t(col_mean_df))
View(trans_col_mean_df)

# List of all the column names
column_names <- list("Lecture", "Tutorial", "Online", "Chapter", "Week")
# List of 12 weeks
Weeks <- c(list(1:12))
print(Weeks)

# Adding Weeks column to Master Dataframe to join other dataframes
master_df <- data.frame(Weeks)

# Changing cloumn name to Weeks in master_df
names(master_df)[1] <- "Weeks"

# In order to align all
for (i in column_names) {
  transpose_temp <- t(data.frame(sapply(c(i),
                                        function(x) trans_col_mean_df[startsWith(names(trans_col_mean_df),x)],
                                        simplify = FALSE)))
  # Adding the number of weeks to temp_df on the basis 
  # of number of rows in each df
  # Dynamic Allocation
  temp_weeks <- c(list(1:dim(transpose_temp)[1]))
  temp_df <- data.frame(temp_weeks,transpose_temp)
  names(temp_df)[1] <- "Weeks"
  names(temp_df)[2]<- i
  rownames(temp_df) <- NULL
  master_df <- merge(x=master_df,y=temp_df, by="Weeks", all.x = TRUE) 
}
View(master_df)

