# Eilif Mikkelsen 2017 - MIT Liscense
# Data Sets used throughout these files
# https://archive.ics.uci.edu/ml/datasets/Concrete+Compressive+Strength
# https://archive.ics.uci.edu/ml/datasets/Wine+Quality
# https://archive.ics.uci.edu/ml/datasets/abalone
# https://archive.ics.uci.edu/ml/datasets/Auto+MPG
# Multiple Linear Regression

#########################################################
# Uncomment the following to install packages
# do not be alarmed if R restarts a couple times. 
# install.packages("car")

#########################################################
library(car)
# We will work with the Abaolne data set for these examples
auto_mpg = read.csv('datasets/auto-mpg.csv')

# We are interested in fitting mpg as a function of the other
# variables in the dataset. The variables are fairly self 
# explanitory and include the horsepower, number of engine
# cylinders, engine displacement, car weight, acceleration,
# model year, and origin. 

# First let's make a scatter plot matrix of all the variables. 
pairs(auto_mpg, lower.panel = NULL)

# Notice that many of the factors appear to be correlated with
# eachother. This violates one of the core tenants of linear
# regression. We will solve this shortly. 

# The obvious first model is one that includes all the 
# available variables. We will fit this using lm like
# we did in simple linear regression
lm_mpg_init = lm(mpg ~ modelyear + 
                  weight + 
                  origin + 
                  horsepower + 
                  displacement +
                  cylinders + 
                  acceleration, data = auto_mpg)

# Let's take a look at the model output
summary(lm_mpg_init)

# Alright, we have 4 significant factors and 
# a significant intercept. Good, but there are 
# some problems to address. We observed a visual
# relationship between mpg and acceleration,
# horsepower, and cylinders yet they are not
# found to be significant in the model. This is likely
# because they are tightly correlated with another
# variable in the model. This is a violation of the multicolinearity
# assumptions of linear regression. 

# One of the easiest tools to determine if 
# multicolinearity is a problem in the model
# is the Variance Inflation Factor or VIF. 
# A VIF value above 1 means that there is "some"
# colinearity between a given variable and the others.
# VIF values above 5 indicate enough colinearity
# that it significantly impacts the model.
# From what we observed in the scatter plot 
# matrix, it's likely that this will be an issue. 

vif(lm_mpg_init)

# Whoa, lots of variables are correlated as they have
# values greater than 5. Let's try again but this time only
# fitting a subset of the variables that appear to both
# explain the response and show limited correlation to eachother. 

lm_mpg_2 = lm(mpg ~ modelyear + weight + origin , data = auto_mpg)

# And let's look at it...
summary(lm_mpg_2)

# NICE! Nearly the same R^2 fit but now we do not have any insignificant
# variables. Let's check the VIF again. 
vif(lm_mpg_2)

# Also good! Now we can move on the other model assumptions. 
# R provides a simple way to visualize the residuals of a linear model. 
# Simply pass the lm variable to the plot function. It will then prompt you to
# press enter to cycle through the plots. 
# For this document we will explicitly call each plot to talk about them. 

# Assumption of Normally Distributed Residuals
# The Normal QQ plot and the *super scientific* "fat pencil test".
# If you put a finger or thick pencil on the screen, the points should be 
# completely covered. In this example, the right tail of the distribution
# does not pass this test. Further analysis might be required, 
plot(lm_mpg_2, which = 2)

# Assumption of Constant Variance of Residuals
# Residuals vs. Fitted Values plot
plot(lm_mpg_2, which = 1)

# We can observe that the vidth of the residuals cloud (variance)
# is not constant throughout the range. Corrective measures are 
# probably worth exploring but this is outside the scope of this course. 

