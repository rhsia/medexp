# file name: make_plots.R
# file description: make plots of underinsurance over time
# last edited: 20171126 by Kaveh

# load packages
library(foreign)
library(ggplot2)
library(dplyr)

# set working directory to meps data location
setwd("/Users/Kaveh/Dropbox/Berkeley/projects/econ/medexp/data_derived")

# load data
meps <- read.csv("meps.csv")

# remove people older than 64
# XX think about whether these ppl should be removed from calculation of hburden in raw data
meps_no_old <- meps %>% 
  filter(age<65)

# change working directory to output location
setwd("/Users/Kaveh/GitHub/medexp/output/")
  
# plot 1
# health care service burden vs time, 1996-2015
meps_clpse_year <- meps_no_old %>%
  group_by(year) %>%
  summarize(hburden = mean(hburden, na.rm=TRUE), 
            n=n()) %>%
  mutate(hburden=hburden*100)

# plot burden over time
ggplot(meps_clpse_year, aes(x=year, y=hburden)) +
  xlab("") +
  ylab("Percent underinsured") +
  theme_minimal(base_size = 12, base_family = "Georgia") +
  geom_point(alpha=0.6) +
  geom_line(alpha=0.6) +
  scale_x_continuous(breaks = c(1996, 2000, 2004, 2008, 2012, 2016)) +
  scale_y_continuous(limits=c(0,10)) 
ggsave("ui.png")

# plot 2
# burden by poverty status
meps_clpse_year_pov <- meps_no_old %>%
  group_by(year, povcat) %>%
  summarize(hburden = mean(hburden, na.rm=TRUE), 
            n=n()) %>%
  mutate(hburden=hburden*100)

# label values
meps_clpse_year_pov$povcat_label <- factor(
  meps_clpse_year_pov$povcat, 
  labels=c('poor', 'near poor', 'low income', 'middle income', 'high income'))

# plot burden over time and by poverty status
ggplot(meps_clpse_year_pov, aes(x=year, y=hburden)) +
  xlab("") +
  ylab("Percent underinsured") +
  theme_minimal(base_size = 12, base_family = "Georgia") +
  geom_point(alpha=0.6, aes(colour = factor(povcat_label))) +
  geom_line(alpha=0.6, aes(colour = factor(povcat_label))) +
  scale_x_continuous(breaks = c(1996, 2000, 2004, 2008, 2012, 2016)) +
  scale_y_continuous(limits=c(0,25)) +
  theme(legend.position="bottom", legend.title=element_blank(), legend.text=element_text(size=9)) 
ggsave("ui_pov.png")


# plot 3
# burden by insurance status
meps_clpse_year_ins <- meps_no_old %>%
  group_by(year, inscov) %>%
  summarize(hburden = mean(hburden, na.rm=TRUE), 
            n=n()) %>%
  mutate(hburden=hburden*100)

# label values
meps_clpse_year_ins$inscov_label <- factor(
  meps_clpse_year_ins$inscov, 
  labels=c('any private', 'public only', 'uninsured'))

# plot burden over time and by insurance status
ggplot(meps_clpse_year_ins, aes(x=year, y=hburden)) +
  xlab("") +
  ylab("Percent underinsured") +
  theme_minimal(base_size = 12, base_family = "Georgia") +
  geom_point(alpha=0.6, aes(colour = factor(inscov_label))) +
  geom_line(alpha=0.6, aes(colour = factor(inscov_label))) +
  scale_x_continuous(breaks = c(1996, 2000, 2004, 2008, 2012, 2016)) +
  scale_y_continuous(limits=c(0,15.5)) +
  theme(legend.position="bottom", legend.title=element_blank(), legend.text=element_text(size=9))
ggsave("ui_ins.png")


# plot 4
# burden by age
meps_clpse_year_age <- meps_no_old %>%
  group_by(year, agecat) %>%
  summarize(hburden = mean(hburden, na.rm=TRUE), 
            n=n()) %>%
  mutate(hburden=hburden*100) %>%
  filter(!is.na(agecat))

# label values
meps_clpse_year_age$agecat_label <- factor(
  meps_clpse_year_age$agecat, 
  labels=c('18-34', '35-54', '55-64'))

# plot burden over time and by age
ggplot(meps_clpse_year_age, aes(x=year, y=hburden)) +
  xlab("") +
  ylab("Percent underinsured") +
  theme_minimal(base_size = 12, base_family = "Georgia") +
  geom_point(alpha=0.6, aes(colour = factor(agecat_label))) +
  geom_line(alpha=0.6, aes(colour = factor(agecat_label))) +
  scale_x_continuous(breaks = c(1996, 2000, 2004, 2008, 2012, 2016)) +
  scale_y_continuous(limits=c(0,17)) +
  theme(legend.position="bottom", legend.title=element_blank(), legend.text=element_text(size=9)) 
ggsave("ui_age.png")


# plot 5
# burden by race
meps_clpse_year_race <- meps_no_old %>%
  group_by(year, race) %>%
  summarize(hburden = mean(hburden, na.rm=TRUE), 
            n=n()) %>%
  mutate(hburden=hburden*100) %>%
  filter(race==1 | race==2 | race==4)

# label values
meps_clpse_year_race$race_label <- factor(
  meps_clpse_year_race$race, 
  labels=c('white / hispanic', 'black', 'asian'))

# plot burden over time and by race
ggplot(meps_clpse_year_race, aes(x=year, y=hburden)) +
  xlab("") +
  ylab("Percent underinsured") +
  theme_minimal(base_size = 12, base_family = "Georgia") +
  geom_point(alpha=0.6, aes(colour = factor(race_label))) +
  geom_line(alpha=0.6, aes(colour = factor(race_label))) +
  scale_x_continuous(breaks = c(1996, 2000, 2004, 2008, 2012, 2016)) +
  scale_y_continuous(limits=c(0,12.5)) +
  theme(legend.position="bottom", legend.title=element_blank(), legend.text=element_text(size=9)) 
ggsave("ui_race.png")


# questions
## who are the gains/losses concentrated within?

# explanations
## people got better insurance
## people less sick
## people more hesitant to go to doctor
