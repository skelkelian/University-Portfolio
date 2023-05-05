library(tidyverse)
km <- kmeans(iris[,3:4], centers = 3)
km$centers

ggplot(data=iris) + 
  geom_point(mapping = aes(x=Petal.Length, y=Petal.Width, color=Species))
ggplot(data=iris) + 
  geom_point(mapping = aes(x=Petal.Length, y=Petal.Width, color=Species)) +
  geom_point(data=as.data.frame(km$centers), mapping = aes(x=Petal.Length, y=Petal.Width), color="red", size=5)
km$cluster

table(iris$Species, km$cluster)