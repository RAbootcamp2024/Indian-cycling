setwd("C:/Users/Owner/Desktop/Indian-cycling-A/analysis_cleaning")
install.packages("fixest")
library("fixest")
pacman::p_load(modelsummary, stargazer)

df_reg <- read_dta("dlhs-reg-data.dta")

demographic <- df_reg |>
  select(sc, st,　obc, hindu, muslim)

household <- df_reg |>
  select(hhheadschool, hhheadmale, land, bpl, media, electricity)

village <- df_reg |>
  select(middle, bank, postoff, lcurrpop)

dist <-  df_reg[c("busdist", "towndist", "railwaydist", "hqdist")]

model1 <- feols(enrollment_secschool~ treat1_female_bihar +
                  treat1_female + treat1_bihar + female_bihar + 
                  treat1 + female + bihar,
                data=df_reg,
                weights =~  hhwt,
                cluster =~ village)
model2 <- feols(enrollment_secschool~ treat1_female_bihar +
                  treat1_female + treat1_bihar + female_bihar + 
                  treat1 + female + bihar 
                + sc + st　+ obc + hindu +muslim,
                data=df_reg,
                weights =~  hhwt, cluster =~ village)


model3 <- feols(enrollment_secschool~ treat1_female_bihar +
                  treat1_female + treat1_bihar + female_bihar + 
                  treat1 + female + bihar
                + sc + st　+ obc + hindu + muslim 
                + hhheadschool + hhheadmale + land + bpl + media+ electricity,
                data=df_reg,
                weights =~  hhwt, cluster =~ village)


model4 <- feols(enrollment_secschool~ treat1_female_bihar +
                  treat1_female + treat1_bihar + female_bihar + 
                  treat1 + female + bihar
                + sc + st　+ obc + hindu + muslim 
                + hhheadschool + hhheadmale + land + bpl + media+ electricity
                + middle + bank + postoff + lcurrpop,
                data=df_reg,
                weights =~  hhwt, cluster =~ village)

#lm lm_robust -> stargazer 
etable(model4, tex = TRUE)

summary(model1)
summary(model2)
summary(model3)
summary(model4)

models <- list(model1, model2, model3, model4)




help(msummary)

#stargazer demonstration
model3 = lm(enrollment_secschool~ treat1_female_bihar,
            data = df_reg)

stargazer::stargazer(model3, type = "latex")

