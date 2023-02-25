# Question 1
summary(esoph)
typeof(esoph$tobgp)

# Question 2
ggplot(data=esoph) + geom_point(mapping=aes(x = seq(1, 88), y = ncases)) + labs(y = "Number of Cases", x = "Index")

# Question 3
age <- table(esoph$agegp)
barplot(age, xlab="Age Group")

# Question 4
ggplot(data=esoph) + geom_point(mapping=aes(x = agegp, y = alcgp))

# Question 5
ggplot(data=esoph) + geom_point(mapping=aes(x = alcgp, y = ncontrols))

# Question 6
ggplot(data=esoph) + geom_point(mapping=aes(x = ncases, y = ncontrols))
