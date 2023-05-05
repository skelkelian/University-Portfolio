library(tidyverse)
?geom_abline
ggplot() + geom_abline(slope=5, intercept = 1.2)
ggplot(data=iris) + geom_point(mapping = aes(x=Petal.Width, y=Petal.Length))
ggplot(data=iris) + geom_point(mapping = aes(x=Petal.Width, y=Petal.Length)) + geom_abline(slope = 1/9, intercept = 2)
ggplot(data=iris) + geom_point(mapping = aes(x=Petal.Width, y=Petal.Length)) + geom_abline(slope = 2.4, intercept = 1)
lm(data = iris, Petal.Length~Petal.Width)
ggplot(data=iris) + geom_point(mapping = aes(x=Petal.Width, y=Petal.Length)) + geom_abline(slope = 2.230, intercept = 1.084)
m <- lm(data = iris, Petal.Length~Petal.Width)
coef(m)
mycf <- coef(m)
mycf[1]
mycf[2]
ggplot(data=iris) + geom_point(mapping = aes(x=Petal.Width, y=Petal.Length)) + geom_abline(slope = mycf[2], intercept = mycf[1], color="red")
summary(m)
coef(m)
residuals(m)
library(modelr)
iris %>% add_residuals(m) %>% view()
iris <- iris %>% add_residuals(m)
ggplot(data=iris) + geom_histogram(mapping = aes(x=resid))

library(tidyverse)
m <- lm(data = iris, Petal.Length~Petal.Width)
library(modelr)
iris <- iris %>% add_residuals(m)
View(iris)
ggplot(data=iris) + geom_histogram(mapping = aes(x=resid))

# Outliers using standardized residuals
iris %>% mutate(rstd=rstandard(m)) %>% view()
irisOutliers <- iris %>% mutate(rstd=rstandard(m)) %>% filter(rstd>2 | rstd< -2)
View(irisOutliers)
m <- lm(data = iris, Petal.Length~Petal.Width)
ggplot(data=iris) + geom_point(mapping = aes(x=Petal.Width, y=Petal.Length))
ggplot(data=iris) + geom_point(mapping = aes(x=Petal.Width, y=Petal.Length)) + geom_point(data=irisOutliers, mapping= aes(x=Petal.Width, y=Petal.Length), color="red")
mycf <- coef(m)
ggplot(data=iris) + geom_point(mapping = aes(x=Petal.Width, y=Petal.Length)) + geom_point(data=irisOutliers, mapping= aes(x=Petal.Width, y=Petal.Length), color="red") + geom_abline(slope=mycf[2], intercept = mycf[1])

# Using the model for prediction
predx <-data.frame(Petal.Width=c(0.5, 1.0, 2.0))
predx
predict(m, predx)
predict(m, predx, interval = "prediction", level = 0.95)
predict(m, predx, interval = "confidence", level = 0.95)
predict(m, predx, interval = "confidence", level = 0.99)

# Multiple linear regression and Adjusted R2
m1 <- lm(data = iris, Petal.Length~Petal.Width)
summary(m1)
m2 <- lm(data = iris, Petal.Length~Petal.Width+Sepal.Width)
summary(m2)
#Petal.Length = 2.258 + 2.156*Petal.Width + (-0.355)*Sepal.Width
iris <- iris %>% mutate(x3=runif(150))
m3 <- lm(data = iris, Petal.Length~Petal.Width+Sepal.Width+x3)
summary(m3)

# Linear regression with categorical variables
library(tidyverse)
library(modelr)
m6 <- lm(data=iris, Petal.Width~Petal.Length+Species)
summary(m6)
iris %>% add_predictions(m6) %>% View()
iris <- iris %>% add_predictions(m6)
ggplot(data=iris) + geom_point(mapping = aes(y=Petal.Width, x=Petal.Length, color=Species))
ggplot(data=iris) + geom_point(mapping = aes(y=Petal.Width, x=Petal.Length, color=Species)) + geom_line(mapping = aes(x=Petal.Length, y=pred, color=Species))

# Linear regression with nonlinear transform of variables
rm(iris)
iris <- iris %>% mutate(PW2= Petal.Width^2)
View(iris)
m7 <- lm(data=iris, Petal.Length~PW2)
summary(m7)
iris %>% add_predictions(m7) %>% view()
iris <- iris %>% add_predictions(m7) %>% view()
ggplot(data=iris) +
geom_point(mapping = aes(x=Petal.Width, y=Petal.Length)) + geom_line(mapping = aes(x=Petal.Width, y=pred), color="red")
