# CPSC 375-01
mydata <- c(10, 20, 30, NA, 50)
mydata
is.na(mydata)

View(airquality)
is.na(airquality$Ozone)
which(is.na(airquality$Ozone))
as.numeric(is.na(airquality$Ozone))
sum(as.numeric(is.na(airquality$Ozone)))
sum(is.na(airquality$Ozone))
mean(airquality$Ozone)
mean(airquality$Ozone, na.rm = TRUE)
complete.cases(airquality)

mydata <- c(10, 20, 30, NA, 50)
mydata
mydata <- c(10, 20, 30, NULL, 50)
mydata
mydata <- c(10, 20, 30, Inf, 50)
mydata
mean(mydata)

names(airquality)
str(airquality)
nrow(airquality)
ncol(airquality)
sum(is.na(airquality$Ozone))
sum(is.na(airquality$Solar.R))
which(is.na(airquality$Solar.R))
mean(airquality$Solar.R, na.rm = TRUE)
library(ggplot2)
ggplot(data=iris) + geom_histogram(mapping = aes(x=Sepal.Length))
ggplot(data=iris) + geom_histogram(mapping = aes(x=Sepal.Length), binwidth = 3)
ggplot(data=iris) + geom_histogram(mapping = aes(x=Sepal.Length), binwidth = 0.3)
ggplot(data=iris) + geom_histogram(mapping = aes(x=Sepal.Length))

# CPSC 375-02
mydata <- c(10, 20, 30, NA, 50)
mydata
is.na(mydata)
View(airquality)
is.na(airquality$Solar.R)
sum(is.na(airquality$Solar.R))
mean(airquality$Solar.R)
mean(airquality$Solar.R, na.rm = TRUE)
?mean
nrow(airquality)
ncol(airquality)
colnames(airquality)
names(airquality)
sum(is.na(airquality$Ozone))
which(is.na(airquality$Ozone))
mean(airquality$Ozone, na.rm = TRUE)
