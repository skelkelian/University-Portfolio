# Question 2
nrow(airquality)
ncol(airquality)
head(airquality, 10) # airquality[1:10, ] (alternative)
mean(airquality$Wind)
airquality[airquality$Month==6, ]
which(airquality$Month==6)
airquality[airquality$Month==6 & airquality$Day<10, ]
max(airquality$Wind)
airquality[max(airquality$Wind), 5:6]

# Question 4
ggplot(data=mpg) + geom_point(mapping=aes(x = displ, y = cty))
ggplot(data=mpg) + geom_point(mapping=aes(x = displ, y = cty)) + labs(title = "Serop Kelkelian", y = "City Miles Per Gallon (mpg)", x = "Engine Displacement (L)") + xlim(0, 10) + ylim(0, 40)
ggplot(data=mpg) + geom_point(mapping=aes(x = displ, y = cty, color = year))
ggplot(data=mpg) + geom_point(mapping=aes(x = displ, y = cty, color = year)) + facet_wrap(~class)
