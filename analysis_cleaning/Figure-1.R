setwd("C:/Users/Owner/Desktop/Indian-cycling-A/analysis_cleaning")
library(tidyverse)
library(ggplot2)
dist.data<-read_dta("schooldist.dta")
age.data<-read.dta("schoolage.dta")

#india figure A.1
figure_A1 = ggplot(age.data,aes(x=age))+
  geom_line(aes(y=100*inschool_india, colour = "all"))+
  geom_line(aes(y=100*inschool_india_male, colour ="male"), linetype="dashed")+
  geom_line(aes(y=100*inschool_india_female, colour = "female"), linetype="dotted")+
  labs(title="India", x="Age(Years)", y="Percent")+
  scale_x_continuous(breaks=seq(8, 16, by=2), labels=seq(8, 16, by=2))+
  scale_y_continuous(limits=c(40,100), breaks=seq(40, 100, by=10), labels=seq(40, 100, by=10))+
  scale_color_manual(name = "", values = c("all" = "black", "male" = "blue", "female" ="red"),
                     labels = c("all" = "all","male" = "male","female" = "female")) +
    theme(legend.position = c(0.2,0.3))

#india bihar figure A.2
figure_A2 = ggplot(age.data,aes(x=age))+
  geom_line(aes(y=100*inschool_bihar, colour = "all"))+
  geom_line(aes(y=100*inschool_bihar_male, colour ="male"), linetype="dashed")+
  geom_line(aes(y=100*inschool_bihar_female, colour = "female"), linetype="dotted")+
  labs(title="Bihar", x="Age(Years)", y="Percent")+
  scale_x_continuous(breaks=seq(8, 16, by=2), labels=seq(8, 16, by=2))+
  scale_y_continuous(limits=c(40,100), breaks=seq(40, 100, by=10), labels=seq(40, 100, by=10))+
  scale_color_manual(name = "", values = c("all" = "black", "male" = "blue", "female" ="red"),
                     labels = c("all" = "all","male" = "male","female" = "female")) +
  theme(legend.position = "none")



  
    
  











ggplot(age.data, aes(x = age, y = c(100*inschool_india, 100*inschool_india_male, 100*inschool_india_female),
                     color = c("inschool_india", "inschool_india_male", "inschool_india_female"), 
                     linetype = c("inschool_india", "inschool_india_male", "inschool_india_female"))) +
  geom_line() +
  scale_y_continuous(limits = c(40, 100)) +
  labs(x = "Age (Years)", y = "Percent", title = "India") +
  scale_color_manual(values = c("black", "blue", "red")) +
  scale_linetype_manual(values = c("solid", "dashed", "dotted")) +
  theme(
    legend.position = "topright",  # Adjust legend position if needed
    legend.title = element_blank(),  # Remove legend title
    legend.text = element_text(size = 8),  # Adjust legend text size
    axis.title = element_text(size = 10),  # Adjust axis title size
    axis.text = element_text(size = 8)     # Adjust axis text size
  )
