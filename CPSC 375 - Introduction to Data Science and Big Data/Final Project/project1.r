#Bryce Lin, Serop Kelkelian

###Part 1: Data Preparation
#Import Library
library(tidyverse)
library(modelr)
#Import dataset
country <- read_csv("https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv")
#remove country_code != 3
country_simplified <- country %>% mutate(iso_code_letter_n = nchar(iso_code)) %>% filter(iso_code_letter_n == 3) 
#remove population < 1000000
country_simplified <- country_simplified %>% filter(population >= 1000000)
#Remove Death
country_simplified <- country_simplified %>% select(!contains("deaths"), new_deaths_smoothed)
#adding new_deaths_smoothed_2wk
country_simplified_2 <- country_simplified %>% select(iso_code, date, new_deaths_smoothed)
country_simplified_2 <- country_simplified_2 %>% mutate(date= date - 14)
country_simplified_2 <- country_simplified_2 %>% mutate(new_deaths_smoothed_2wk = new_deaths_smoothed) %>% select(-new_deaths_smoothed)
Country_simplified_3 <- inner_join(country_simplified, country_simplified_2)
#Demographic Table
demo <- read_csv("demographics.csv")
demo1 <- demo %>% select(-`Series Name`, -`Country Name`) %>% pivot_wider(names_from = `Series Code`, values_from = YR2015)
#Join 2 tables
Country_simplified_4 <- Country_simplified_3 %>% left_join(demo1, by = join_by(iso_code == `Country Code`))

###Part 2 Linear Modeling
#Add 3 transformed variables
Country_simplified_5 <- Country_simplified_4  %>% mutate(likely_death=SP.POP.65UP.MA.IN*total_cases) %>% mutate(cases = new_cases_smoothed*SP.DYN.AMRT.MA) %>% mutate(cardiovasc_urban = cardiovasc_death_rate * SP.URB.TOTL)

#splitting train/test sets
train <- Country_simplified_5 %>% filter(date >= as.Date("2022-01-01") & date <= as.Date("2022-12-31"))
test <- Country_simplified_5 %>% filter(date >= as.Date("2023-01-01") & date <= as.Date("2023-12-31"))

#Training model
models <- lm(data = train, formula = new_deaths_smoothed_2wk~new_vaccinations_smoothed+extreme_poverty+hosp_patients+hosp_patients_per_million+SP.POP.80UP.FE+cases+likely_death+cardiovasc_urban)
model3 <- lm(data = train, formula = new_deaths_smoothed_2wk~gdp_per_capita+population_density+SP.URB.TOTL+likely_death)
modelx <- lm(data = train, formula = new_deaths_smoothed_2wk~weekly_icu_admissions+gdp_per_capita+diabetes_prevalence+icu_patients+SP.POP.TOTL.FE.IN+cardiovasc_urban)
modely <- lm(data = train, formula = new_deaths_smoothed_2wk~life_expectancy+excess_mortality+icu_patients+SP.POP.1564.MA.IN)
modele <- lm(data = train, formula = new_deaths_smoothed_2wk~new_cases_smoothed+median_age+diabetes_prevalence+icu_patients+SP.DYN.LE00.IN)

###Part 3: Evaluation
#Accuracy
rmse(models, test)
rmse(model3, test)
rmse(modelx, test)
rmse(modely, test)
rmse(modele, test)
test %>% group_by(iso_code) %>% summarise(rmse(models, data=cur_data())) %>% View()
