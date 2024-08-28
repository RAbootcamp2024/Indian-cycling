setwd("C:/Users/Owner/Desktop/Indian-cycling-A")
#install.packages("pacman")
pacman::p_load(tidyverse, haven)
df_longwd <- read_dta("analysis_cleaning/dlhs_long_wdist.dta")

#欠損値処理
df_longwd$school[is.na(df_longwd$school)] <-0
df_longwd$grade[is.na(df_longwd$grade)] <-0
df_longwd$relationship[is.na(df_longwd$relationship)] <- 0

#フィルター
df <- df_longwd |>
  filter(state == 10 | state == 20) |>
  mutate(inschool=if_else(school==1, 1, 0), #Indicator variable for being in school
         currgrade = if_else(inschool == 1, grade + 1, grade),#Current grade
         enrollment_secschool= if_else(currgrade==9|grade>=9, 1, 0),
         enrollment_middleschool= if_else(currgrade==8|grade>=8, 1, 0),
         female=sex-1,  #femaleが1
         bihar=if_else(state==10, 1, 0),
         child_sample=if_else(relationship == 3|relationship == 5|relationship == 8|relationship == 10, 1, 0),
         sc=if_else(hv116b == 1, 1, 0),
         ) 

  
 
