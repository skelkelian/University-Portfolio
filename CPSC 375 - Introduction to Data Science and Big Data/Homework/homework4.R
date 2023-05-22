# Problem 1
# Load the nycflights13 library (will have to install the nycflights13 package first) which contains
# flight arrival and departure data in a table called flights. Apply the tidyverse’s data wrangling 
# verbs to answer these questions. For each question, give only the (one line as a data pipeline) code 
# beginning with flights %>% 

# Question 1
# Show the average arrival delay for all flights.
flights %>% summarise(mean(arr_delay, na.rm = TRUE))

# Question 2
# Show the average arrival delay for every departure city.
flights %>% group_by(origin) %>% summarise(mean(arr_delay, na.rm = TRUE))

# Question 3
# Show the average arrival delay for every departure-arrival city pair.
flights %>% group_by(origin, dest) %>% summarise(mean(arr_delay, na.rm = TRUE))


# Problem 2
bands <- data.frame(name = c("Mick", "John", "Paul", "Paul"), lastname = c("Jagger", "Lennon", "McCartney", "McCartney"), band = c("Stones", "Beatles", "Beatles", "Wings"), year = c(1962, 1960, 1960, 1971))
instruments <- data.frame(artist = c("John", "Paul", "Keith", "Paul"), artistname = c("Lennon", "McCartney", "Richards", "McCartney"), plays = c("guitar", "bass", "guitar", "bass"), model = c("Gibson", "Hofner", "Fender", "Hofner"))

# Problem 3
# Question 1
# Give the code to convert billboard to a tidy table and store it in a tibble called billboard_tidy.
billboard_tidy <- billboard %>%
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    names_prefix = "wk",
    values_to = "rank",
    values_drop_na = TRUE
  ) 

# Question 2
# Show for each track, how many weeks it spent on the chart
billboard_tidy %>% group_by(track) %>% summarise(week = n()) %>% View()

# Question 3
# List tracks in decreasing order of number of weeks spent on the chart
billboard_tidy %>% group_by(track) %>% summarise(week = n()) %>% arrange(-week) %>% View()

# Question 4
# Show for each track, its top rank
billboard_tidy %>% group_by(track) %>% summarise(top_rank = min(rank)) %>% View()

# Question 5
# List tracks in increasing order of its top rank
billboard_tidy %>% group_by(track) %>% summarise(top_rank = min(rank)) %>% arrange(top_rank) %>% View()

# Question 6
# Show for each artist, their top rank
billboard_tidy %>% group_by(artist) %>% arrange(-rank) %>% summarise(top_rank = min(rank)) %>% View()

# Question 7
# List artists in increasing order of their top rank
billboard_tidy %>% group_by(artist) %>% summarise(top_rank = min(rank)) %>% arrange(top_rank) %>% View()

# Question 8
# List tracks that only spent one week in the charts
billboard_tidy %>% group_by(track) %>% summarise(week=n()) %>% filter(week==1) %>% View()

# Question 9
# List tracks that only spent one week in the charts along with its artist
billboard_tidy %>% group_by(artist, track) %>% summarise(week=n()) %>% filter(week==1) %>% View()


# Problem 4
# Consider the attached .csv file, “insurance_premiums.csv,” which contains the Average Annual Single Premium 
# per Enrolled Employee For Employer-Based Health Insurance. The goal is to convert this dataset to tidy format.

# Question 1
# Pivot all columns into two names_to columns, then pivot again! Specifically, do the following steps. 
# Read the .csv file using read_csv (NOT read.csv) and store it in a table.
premiums <- read_csv("insurance_premiums.csv")

# Question 2
# Pivot_longer all columns except Location into two names_to columns. This requires a names_sep to be specified.
premiums %>% pivot_longer(-Location, names_to = c("Year", "Contribution"), names_sep = "__")

# Question 3
# Pivot_wider a pair of columns from the previous step. 
premiums %>% pivot_longer(-Location, names_to = c("Year", "Contribution"), names_sep = "__") %>% pivot_wider(names_from = "Contribution")

# Question 4
# Check that the resulting table matches the desired tidy format. Show the output of str() for the tidy table.
premiums %>% pivot_longer(-Location, names_to = c("Year", "Contribution"), names_sep = "__") %>% pivot_wider(names_from = "Contribution") %>% str()
