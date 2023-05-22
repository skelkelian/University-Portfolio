# Problem 1
# No code needed


# Problem 2
# The pima-indians-diabetes-resampled.csv file on Canvas contains records indicating
# whether the subjects have diabetes or not, along with certain diagnostic measurements.
# All subjects are of Pima Indian heritage and this dataset is called the Pima Indian 
# Diabetes Database. The goal is to see if it is possible to predict if a subject has 
# diabetes given some of the diagnostic measurements. (Note: this problem is an extension
# of the classwork assignment; R code from the class is also posted on Canvas.)

# Question 1
# Read the data file [code]
library(tidyverse)
diabetes <- read.csv('pima-indians-diabetes-resampled.csv')

# Question 2
# What does “Preg” represent in the dataset? (2-3 sentences. Search for the Pima
# Indian Diabetes Database online and read up on its background.)
  # It represents how many pregnancies the person has on the database. One research 
  # I found is about diabetic pregnancy on the offspring among the Pima Indians.

# Question 3
# 0 values in the Glucose column indicate missing values. Remove rows which contain
# missing values in the Glucose column. You should have 763 rows. [code]
diabetes <- diabetes %>% filter(Glucose != 0)

# Question 4
# Create three new columns/variables which are the normalized versions of Preg, 
# Pedigree, and Glucose columns, scaling the minimum-maximum range of each column
# to 0-1 (you can use the code developed in class). [code]
diabetes <- diabetes %>% mutate(Preg.norm = (Preg - min(Preg)) / (max(Preg)-min(Preg))) %>% mutate(Glucose.norm = (Glucose - min(Glucose)) / (max(Glucose)-min(Glucose))) %>% mutate(Pedigree.norm = (Pedigree - min(Pedigree)) / (max(Pedigree)-min(Pedigree)))

# Question 5
# Split the dataset into train and test datasets with the first 500 rows for training,
# and the remaining rows for test. Do NOT randomly sample the data (though resampling
# is usually done, this hw problem does not use this step for ease of grading).
library(class)

# Question 6
# Train and test a k-nearest neighbor classifier with the dataset. Consider only 
# the normalized Preg and Pedigree columns. Set k=1. What is the error rate 
# (number of misclassifications)? [code, error rate]
diabetes.train.feature <- diabetes[1:500,c(10, 7)]
diabetes.train.label <- diabetes[1:500, 9]
diabetes.test.feature <- diabetes[501:nrow(diabetes), c(10,7)]
diabetes.test.label <- diabetes[501:nrow(diabetes), 9]
predicted <- knn(train = diabetes.train.feature, test = diabetes.test.feature, cl=diabetes.train.label, k = 1)
table(predicted, diabetes.test.label)

# Question 7
# Repeat part (f) but consider the normalized Preg, Pedigree, and Glucose columns.
# Set k=1. What is the error rate? Will the error rate always decrease with a larger
# number of features? Why or why not: answer in 2-3 sentences? [code, error rate, answer]
diabetes.train.feature <- diabetes[1:500,c(10, 7, 2)]
diabetes.train.label <- diabetes[1:500, 9]
diabetes.test.feature <- diabetes[501:nrow(diabetes), c(10,7,2)]
diabetes.test.label <- diabetes[501:nrow(diabetes), 9]
predicted <- knn(train = diabetes.train.feature, test = diabetes.test.feature, cl=diabetes.train.label, k = 1)
table(predicted, diabetes.test.label)
  # Yes, it will decrease with larger number of feature, but it need to be  
  # relative information to the value that we are trying to predict. If it is a  
  # random variable, it may increase the error rate instead.

# Question 8
# Repeat part (g) but set k=5. What is the error rate? [code, error rate]
predicted <- knn(train = diabetes.train.feature, test = diabetes.test.feature, cl=diabetes.train.label, k = 5)
table(predicted, diabetes.test.label)

# Question 9
# Repeat part (h) but set k=11. What is the error rate? Considering your observations
# from (g)-(i), which is the best value for k? [code, error rate, answer]
predicted <- knn(train = diabetes.train.feature, test = diabetes.test.feature, cl=diabetes.train.label, k = 11)
table(predicted, diabetes.test.label)


# Problem 3
# No code needed


# Problem 4
# Consider the file breast-cancer-wisconsin.csv (in the Datasets module on Canvas)
# which contains “Features computed from a digitized image of a fine needle aspirate
# (FNA) of a breast mass.” The goal is to cluster the data based on the features
# to distinguish Benign and Malignant cases.

# Question 1
# Read the data from the file into an object called “mydata”. Column 1 (“Code”)
# is the anonymized subject code and will not be used here. Columns 2-10 are the
# 9 features. Column 11 is the diagnosis: [B]enign or [M]alignant.
# Part 1
# How many total cases are there in the data?: ___
nrow(bcancer)

# Part 2
# How many [B]enign cases are there in the data?: ___
bcancer %>% filter(Class == "B") %>% summarise(n())

# Part 3
# How many [M]alignant cases are there in the data?: ___
bcancer %>% filter(Class == "M") %>% summarise(n())

# Question 2
# Run k-means clustering using all the rows and only the following features: 
# ClumpThickness, CellSize, and Nuclei. Use nstart=10.
# Part 1
# What should be the value of k?
  # k = 2

# Part 2
# Give R code:
cluster <- bcancer %>% select(ClumpThickness, CellSize, Nuclei) %>% kmeans(centers = 2, nstart = 10)

# Question 3
# Evaluation: Compare the resulting clusters with the known diagnosis. 
# Part 1
# Complete the contingency table of your clustering. (Hint: use R’s table() 
# function. You can arbitrarily assign cluster 1/2 to Benign/Malignant)

# Part 2
# Give R code:
table(bcancer$Class, cluster$cluster)


# Problem 5
# Using the contingency table that you obtained from the previous problem (3.c),
# calculate the following metrics (consider Malignant as the Positive class): 
# Accuracy = (437  + 219) / (437 + 219 + 20 + 7) = 656 / 683 = 96.05%
# Error = 1 - 96.05 % = 3.95%
# Precision = 219 / (7 + 219) = 96.90%
# Recall = 219 / (219 + 20) = 91.63%
# F-score = 2 x 0.969 x 0.9163 / (.969 + .9163) = 1.7757894 / 1.8853 = 94.19%

# Consider a “silly” classifier for this problem that makes every prediction as Malignant. Calculate the metrics for this “silly” classifier.
# Accuracy = 239 / 683 = 34.99%
# Error = 1 - 34.99% = 65.01%
# Precision = 239 / 683 = 34.99%
# Recall = 239 / 239 = 100%
# F-score = 2 x 34.99% x 100% / (1 + .3499) = 51.84%
