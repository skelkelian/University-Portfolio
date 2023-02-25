library(ggplot2)
# one numerical variable
ggplot(data=iris) + geom_boxplot(mapping=aes(y=Sepal.Width))
# numerical variable and categorical variable
ggplot(data=iris) + geom_boxplot(mapping=aes(y=Sepal.Width, x=Species))

# one categorical variable
ggplot(data=mpg)+ geom_bar(mapping = aes(x=class))
# two categorical variables
ggplot(data=mpg)+ geom_bar(mapping = aes(x=class, fill=drv))
ggplot(data=mpg)+ geom_bar(mapping = aes(x=class, fill=drv), position = "dodge")

str(airquality)
# converting to a factor
airquality$Month <- as.factor(airquality$Month) 
str(airquality)
rm(airquality) # reverting to original data (built-in)
str(airquality)