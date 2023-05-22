# Problem 1
# Load the “mystery” vector in file myvec.RData on Canvas under Datasets using 
# load("myvec.RData"). Decompose the time series data into trend, seasonal, and 
# random components. 
# Specifically, write R code to do the following:

# Question 1
# Load the data. 
myvec <- get(load("myvec.rdata"))

# Question 2
# Find the frequency of the seasonal component (Hint: use the autocorrelation plot.
# You must specify the lag.max parameter in acf() as the default is too small.)  
acf(myvec, lag.max = 100)

# Question 3
# Convert to a ts object
myvec.ts <- ts(myvec, frequency = 25) 

# Question 4
# Decompose the ts object. Plot the output showing the trend, seasonal, random components.
plot(decompose(myvec.ts))


# Problem 2
# No code needed


# Problem 3
# Question 1
# Complete the R function below to compute the DTW distance between two 
# time-series, A and B, each containing 2D points and using the cost function as
# in Q2 above. So A and B will have two columns but a varying number of rows.
# dtw <- function (A, B) {
#   M <- nrow(A)
#   N <- nrow(B)
#   Cost <- matrix(0,M,N) # Initialize with zeros
#   for (i in 1:M) {
#     for (j in 1:N) {
#       Cost[i,j] <- as.numeric((A[i,1] - B[j,1])^2 + (A[i,2] - B[j,2])^2) # distance function
#     }
#   }
#   C <- matrix(0,M,N) # Initialize with zeros
#   C[1,1] <- Cost[1,1] # Value for top left cell
#   for (i in 2:M) { # Values for first column
#     C[i,1] <- C[i-1,1] + Cost[i,1]
#   }
#   for (j in 2:N) { # Values for first row
#     C[1,j] <- C[1,j-1] + Cost[1,j]
#   }
  #
  # Values for other rows and columns
  # TO BE COMPLETED
  #
  for (i in 2:M){
    for (j in 2:N){
      C[i,j] <- min(C[i-1,j], C[i,j-1],C[i-1,j-1]) + Cost[i,j]
    }
  }

# Question 2
# Verify your answer to Q2 using the above function. You can create the two input time-series as a two-column data.frame/tibble like so: 
# A <- tibble("x" = c(2, 0, 2, 4), "y" = c(2, 4, 6, 5))
A <- tibble("x" = c(2, 0, 2, 4), "y" = c(2, 4, 6, 5))
B <- tibble("x" = c(1,0,4), "y" = c(1,6,4))
dtw(A,B)


# Problem 4
# You are given 4 time-series of 2D points (2 column tables) in CSV files: 
# char1_A.csv, char1_E.csv, char1_M.csv, char1_O.csv, and char4_.csv 
# (under Datasets module on Canvas). Each represents one of the English alphabet 
# characters A, E, M, and O as written on a tablet computer. For instance, 
# char1_A.csv, represents the character “A”. Your goal is to identify which 
# character is represented by the 5th file (char4_.csv) using DTW and the cost 
# function used in Q2 and Q3.

# Question 1 
# Explain your approach in 2-3 sentences.
# Import all the cvs file into the Rstudio and compare all known cases to the 
# unknown cases to see which one have the lowest cost.

# Question 2
# Show your R code and output
A <- read.csv("char1_A.csv")
E <- read.csv("char1_E.csv")
M <- read.csv("char1_M.csv")
O <- read.csv("char1_O.csv")
unknown <- read.csv("char4_.csv")

# Question 3
# char4_.csv represents character: M
  