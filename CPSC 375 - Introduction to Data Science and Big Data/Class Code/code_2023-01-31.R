c(10,20,30,40,45,56,74,23,300)
mydata <- c(10,20,30,40,45,56,74,23,300)
mydata
mydata[3]
mydata[c(3,5)]
mydata[3:5]
mydata > 50
mydata[mydata > 50]
which(mydata > 50)
mydata[c(6,7,9)]
iris
View(iris)
class(iris$Species)
levels(iris$Species)
iris[1:10,]
iris$Sepal.Length
iris[,"Sepal.Length"]
iris[,1]

mean(iris[,"Sepal.Length"])
mean(iris$Sepal.Length)
iris[ iris$Sepal.Length > 7.6 , ]
iris[iris$Species == "setosa", ]
iris[iris$Species == "setosa" & iris$Sepal.Length > 3.0, ]
max(iris[, 1])
max(iris$Sepal.Length)
iris[iris$Sepal.Length == max(iris$Sepal.Length), ]
iris[iris$Sepal.Length == max(iris$Sepal.Length), "Species"]
iris[iris$Sepal.Length == max(iris$Sepal.Length), 5]
