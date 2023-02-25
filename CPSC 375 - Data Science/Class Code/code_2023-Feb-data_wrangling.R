library(tidyverse)
View(mpg)
filter(mpg, cty > 27)
filter(mpg, cty > 27, hwy > 30)
filter(mpg, manufacturer=="honda" | manufacturer=="toyota")
filter(mpg, manufacturer=="honda" , manufacturer=="toyota")
filter(mpg, manufacturer=="honda" | manufacturer=="toyota"| manufacturer =="audi")
filter(mpg, manufacturer %in% c("honda","toyota","audi"))

select(mpg, manufacturer)
select(mpg, manufacturer, model)
select(mpg, 1:4)
select(mpg, -manufacturer, -model)
select(mpg, starts_with("m"))

select(filter(mpg, cty > 25), manufacturer, model)
mpg %>% filter(cty > 25) %>% select(manufacturer, model)

iris %>% filter(Petal.Length>3, Petal.Width>1) %>% select(Sepal.Length, Sepal.Width)
iris  %>% select(Sepal.Length, Sepal.Width)%>% filter(Petal.Length>3, Petal.Width>1) # does not work

mpg %>% arrange(manufacturer)
mpg %>% arrange(cty)
mpg %>% arrange(cty, hwy)
mpg %>% arrange(-cty)
mpg %>% arrange(-manufacturer)
mpg %>% arrange(desc(manufacturer))
mpg %>% arrange(-cty)
mpg %>% arrange(desc(cty))

mpg %>% mutate((cty+hwy)/2) %>% View()
mpg %>% mutate(avemileage = (cty+hwy)/2) %>% View()
mpg %>% mutate(avemileage = (cty+hwy)/2) %>% select(1:9, avemileage, 10:11) %>% View()
