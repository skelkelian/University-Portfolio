# Problem 1
# Create a word cloud of some of the most commonly occurring words in Jane 
# Austen’s novel “Sense & Sensibility''. The full text of all six novels are 
# available in the janeaustenr package and its function austen_books().
# install.packages(“janeaustenr”)
# library(janeaustenr)
# austen_books() %>% …
library(dplyr)
# Write R code to do the following tasks (you can refer to the text processing R
# code posted on Canvas):

# Question 1
# Get only the text of “Sense & Sensibility”
austen_books() %>% filter(book == "Sense & Sensibility")

# Question 2
# Convert your data to the “tidy” format, i.e., one word per row (Hint: unnest_tokens()).
library(tidytext)
text_df <- austen_books() %>% filter(book == "Sense & Sensibility") %>% select(text) %>% unnest_tokens(word, "text")

# Question 3
# Remove stop words (Hint: anti_join(stop_words))
text_df <- text_df %>% anti_join(stop_words)

# Question 4
# Retain only words that appear greater than 100 times in the novel (Hint: count())
text_df <- text_df %>% count(word) %>% filter(n > 100)

# Question 5
# Create a wordcloud
library(wordcloud)
wordcloud(text_df$word, text_df$n)


# Problem 2
# No code needed


# Problem 3
# Write R code to create the final Tf-Idf weighted Document-Term matrix (i.e., 
# one column for every document) for the same three documents in Q2 using the
# tidytext package.
# mydata <- tibble(document=1:3,text=c("good morning everybody", "good evening everybody", "good night"))
mydata %>% unnest_tokens(input = text, output = "word") %>% count(document, word) %>% bind_tf_idf(term=word, document = document, n=n) %>% select(document, word, tf_idf) %>% pivot_wider(names_from = document, values_from = tf_idf, values_fill = 0)



# Problem 4
# Define a function that takes two vectors as input and computes their cosine similarity: 
# Note: your function does not need any loops as you can use the vectorized operators 
# in R. Test your function for correctness. For instance, the cosine similarity of any
# vector to itself is 1 and cosine similarity between vectors (1,2,3) and (0,2,5) should be 0.9429
cossim <- function(x, y){
  x.norm <- x / sqrt(sum(x^2))
  y.norm <- y / sqrt(sum(y^2))
  return (sum(x.norm*y.norm))
}


# Problem 5
# Use the function defined in Q3 to compute the cosine similarity between every pair of documents in Q1.
# cossim(Document 1, Document 2) = 0.1198832
# cossim(Document 1, Document 3) = 0
# cossim(Document 2, Document 3) = 0
# Which of the three documents is the odd one out? Why (1-2 sentences)?
  # Document 3, because IDF removes the only common words it has from other 
  # documents, and the unique word in Document 3 is not in any other documents.

# Question 1
# The goal of this exercise is to use the word-based analysis from class to compare the six novels of Jane Austen. Use the janeaustenr package from Q1. 
# Write a single data pipeline that will transform the text data into Tf-Idf weighted vectors. The pipeline should:
  #  Convert your data to the “tidy” format, i.e., one word per row.
  # Remove stop words
  # Stem the words (Hint: wordStem() from library(SnowballC) )
  # Retain only words that appear greater than 5 times in a novel
  # Calculate Tf-Idf weights
  # Convert to a table of vectors format (a column represents the vector representation of a novel).
  # Give the R code that performs these steps. What is the dimension of the vectors?
text_df <- austen_books() %>% group_by(book) %>% unnest_tokens(word, text) %>% anti_join(stop_words) %>% count(book, word) %>% filter(n > 5) %>% bind_tf_idf(term = word, document = book, n = n) %>% select(book, word, tf_idf) %>% pivot_wider(names_from = book, values_from = tf_idf, values_fill = 0)

# Question 2
# Write R code to compare every pair of Jane Austen’s novels by computing the 
# cosine similarity between their corresponding tf-idf vectors calculated in Q5(a). 
# What is the cosine similarity of these two novels?
for (i in 2:6){
  for(j in (i+1):7){
    cat(i, j, cossim(text_df[i], text_df[j]), "\n")
  }
}
