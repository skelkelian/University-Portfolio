# Problem 1
# Body fat percentage refers to the relative proportions of body weight in terms 
# of lean body mass (muscle, bone, internal organs, and connective tissue) and 
# body fat. The most accurate means of estimating body fat percentage are cumbersome
# and require specialized equipment. Instead, we can estimate body fat percentage
# from other measurements. 

# The bodyfat.csv file in the Datasets module on Canvas contains 13 measurements
# from subjects (all men) along with their body fat percentage. Read the file and
# answer the following questions.

# Question 1
# Plot BodyFat vs. Height (code, plot). Which is the dependent variable? 
# Which is the independent variable?
ggplot(data=bodyfat) + geom_point(mapping=aes(x = Height, y = BodyFat))
# The independent variable is height and the dependent variable is BodyFat

# Question 2
# There is one obvious outlier in the Height column. Remove the corresponding row 
# from the data and plot again. (Show: code to remove the row, plot). This will be the
# data used for the following questions. Confirm that the mean Height is now 70.31076.
bodyfat %>% filter(Height > min(Height)) %>% ggplot() + geom_point(mapping = aes(x = BodyFat, y = Height))
bodyfat %>% filter(Height > min(Height)) %>% summarise(mean(Height))

# Question 3
# Create a linear model of BodyFat vs. Height. (code, output of summary(model))
m <- lm(formula = BodyFat ~ Height, data = bodyfat2)
mycf <- coef(m)
ggplot(data=bodyfat2) + geom_point(mapping = aes(x=Height, y=BodyFat)) + geom_abline(slope = mycf[2], intercept = mycf[1], color="red")
  # What is the R2 value?
    # Multiple R-squared:  0.0005468
  # Is this a “good” model? Why or why not?
    # No because the R-squared value is too low meaning there is a lot of variance in the data.
  # What is the linear equation relating BodyFat and Height according to this model?
    # lm(formula = BodyFat ~ Height, data = bodyfat2)
  
# Question 4
# Create a linear model of BodyFat vs. Weight. (code, output of summary(model))
m <- lm(formula = BodyFat ~ Weight, data = bodyfat2)
mycf <- coef(m)
summary(m)
  # What is the R2 value?
    # Multiple R-squared: 0.3731
  # Is this a better model than that based on Height? Why or why not?
    # Yes because there was much less data variance as shown by the R-squared value
  # What is the linear equation relating BodyFat and Weight according to this model?
    # lm(formula = BodyFat ~ Weight, data = bodyfat2)
  # Plot BodyFat vs. Weight and overlay the best fit line. 
  # Use a different color for the line. (plot, code)
  ggplot(data=bodyfat2) + geom_point(mapping = aes(x=Weight, y=BodyFat)) + geom_abline(slope = mycf[2], intercept = mycf[1], color="red")
  # Plot the histogram of residuals (plot, code). Does this show an approximately
  # normal distribution?
  bodyfat2 <- bodyfat2 %>% add_residuals(m)
  ggplot(data=bodyfat2) + geom_histogram(mapping = aes(x=resid))
  # From the model, predict the BodyFat for two persons: Person A weighs 175 lbs, 
  # Person B weighs 250 lbs. Include the 99% confidence intervals for the predictions. 
  # In which prediction (for Person A or B), are you more confident? Why?

# Question 5
# Create a linear model of BodyFat vs. Weight and Height. (code, output of summary(model))
m <- lm(formula = BodyFat ~ Weight + Height, data = bodyfat2)
mycf <- coef(m)
ggplot(data=bodyfat2) + geom_point(mapping = aes(x=Weight + Height, y=BodyFat)) + geom_abline(slope = mycf[2], intercept = mycf[1], color="red")
  # What is the R2 value?
    # Multiple R-squared:  0.5094
  # Is this a better model than that based only on Weight or Height? Why or why not?
    # Yes because there was less data variance when it was based on weight and
    # height than when it was based on just one factor or the other. This is
    # proven by the R-squared value.
  # What is the linear equation relating BodyFat, Weight, and Height according to this model?
    # BodyFat = 72.52439 + 0.23195 x Weight + (-1.34979) x Height
  # From the model, predict the BodyFat for two persons: Person A weighs 175 lbs, Person B
  # weighs 250 lbs. Both persons have height=70”. Include the 99% confidence intervals for
  # the predictions. In which prediction (for Person A or B), are you more confident? Why?
    # I am more confident in the prediction for person A because the predicted
    # Body Fat % is more closely related to actual results for a person who
    # weighs ~175lbs at 70” height.
  predx <- data.frame(Weight=c(175, 250), Height=c(70, 70))
  predict(m, predx, interval = "confidence", level = 0.99)
  
# Question 6
# Add a new transformed variable BMI = Weight/Height2 to the dataset. Create a linear
# model of BodyFat vs. BMI.
  # Give R code, output of summary(model)
  bodyfat3 <- bodyfat2 %>% mutate(BMI = (Weight / Height^2))
  m <- lm(formula = BodyFat ~ BMI, data = bodyfat3)
  mycf <- coef(m)
  ggplot(data=bodyfat3) + geom_point(mapping = aes(x=BMI, y=BodyFat)) + geom_abline(slope = mycf[2], intercept = mycf[1], color="red")
  summary(m)
  # Is this a better model than the previous models? Why or why not?
    # Yes because there was less data variance when it was based on BMI than
    # when it was based on Weight and Height or one or the other. This is proven
    # by the R-squared value.
  # What is the equation relating BodyFat, Weight, and Height according to this
  # model? Is this a linear or nonlinear equation?
    # The equation relating BodyFat, Weight, and Height together is BMI =
    # (Weight / Height^2). This is a linear equation.
  # Plot BodyFat vs. BMI and overlay the best fit model as a straight line. (code, plot)
    ggplot(data=bodyfat3) + geom_point(mapping = aes(x=BMI, y=BodyFat)) +
      geom_abline(slope = mycf[2], intercept = mycf[1], color="red")
  # From the model, predict the BodyFat for two persons: Person A weighs 175 lbs,
  # Person B weighs 250 lbs. Both persons have height=70”. Include the 99%
  # confidence intervals for the predictions
    predx <- data.frame(Weight = c(175, 250), Height = c(70, 70), BMI = c(175/(70^2),250/(70^2)))
    predict(m, predx, interval = "confidence", level = 0.99)
  # Body Mass Index (BMI) is actually defined as a person’s weight in kilograms
  # divided by the square of height in meters but your data 2 has Weight in pounds
  # and Height in inches. Thus, the correct BMI transformation should have been
  # BMI = (Weight/2.20)/(Height*0.0254)2. Would using this correct BMI transformation
  # result in a different model from what was calculated? Why or why not?
    # Yes there is a different slope because every value needs to be converted to
    # kg and meters which results in 704.55.
  
# Question 7
# Add a new categorical variable (factor) AgeGroup to the dataset. AgeGroup should
# have three values: “Young” for Age<40, “Middle” for Age between 40 and 60, and “Older”
# for Age>60.
  # Show R code that adds the AgeGroup variable. This can be done with mutate
  # and the cut() function like so: cut (Age, breaks = c(-Inf,40,60,Inf),
  # labels = c("Young", "Middle", "Older")[Code]
    bodyfat4 <- bodyfat3 %>% mutate(ageGroup=cut(Age, breaks = c(-Inf,40,60,Inf), labels = c("Young", "Middle", "Older")))
  # Create a linear model of BodyFat vs. BMI and AgeGroup.[Code, output of
  # summary(model)]
    m <- lm(formula = BodyFat ~ BMI + ageGroup, data = bodyfat4)
    summary(m)
  # How many dummy (i.e., 0-1) variables were created in the model?
    # 2
  # Is this a better model than the previous models? Why or why not?
    # Yes because there was less data variance when the model included age
    # group than when it was based on Weight and Height or one or the other.
    # This is proven by the R-squared value being greater than previous models.
  # What are the set of equations relating BodyFat, BMI, and AgeGroup according to
  # this model?
    # if Age < 40
      # BodyFat = -22.8344+1105.0576*BMI
    # if Age > 40 and Age < 60
      # BodyFat = -22.8344+1105.0576*BMI+2.6113*1
    # if Age > 60
      # BodyFat = -22.8344+1105.0576*BMI+5.3074*1
  # Plot BodyFat vs. BMI and overlay the model predictions (Hint: add a new column 
  # with predictions and plot the predictions using geom_line. You should see
  # multiple lines, one for each value of the discrete variable). [Code, plot]
  bodyfat4 <- bodyfat4 %>% add_predictions(m)
  ggplot(data = bodyfat4) +
    geom_point(mapping = aes(y = BodyFat, x = BMI, color = ageGroup)) +
    geom_line(mapping = aes(x = BMI, y = pred, color = ageGroup))


