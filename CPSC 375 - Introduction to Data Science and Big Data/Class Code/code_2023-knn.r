trainindex <- sample(1:150, 100)
trainfeatures <- iris[trainindex, 1:4]
trainlabels <- iris[trainindex, 5]

testindex <- setdiff(1:150, trainindex)
testfeatures <- iris[testindex, 1:4]
testlabels <- iris[testindex, 5]

library(class)
predicted <- knn(train = trainfeatures, test = testfeatures, cl=trainlabels, k=1)
data.frame(testlabels, predicted) %>% View()
table(testlabels, predicted) # to see how many errors

predicted2 <- knn(train = trainfeatures, test = testfeatures, cl=trainlabels, k=2)
table(testlabels, predicted2) # to see how many errors

# normalization
x <- c(16, 50, 37, 100)
(x - min(x)) / (max(x) - min(x))
normalize <- function(x) {
return ((x - min(x)) / (max(x) - min(x)))
}
normalize(x)
View(iris)
library(tidyverse)
iris %>% 
  mutate(Sepal.Length.norm=normalize(Sepal.Length)) %>% 
  View()
iris %>% 
  mutate(Sepal.Length.norm=normalize(Sepal.Length)) %>% 
  mutate(Petal.Length.norm=normalize(Petal.Length)) %>% 
  View()