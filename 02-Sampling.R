# Eilif Mikkelsen 2017 - MIT Liscense
# Data Sets used throughout these files
# https://archive.ics.uci.edu/ml/datasets/Concrete+Compressive+Strength
# https://archive.ics.uci.edu/ml/datasets/Wine+Quality
# https://archive.ics.uci.edu/ml/datasets/abalone
# https://archive.ics.uci.edu/ml/datasets/Auto+MPG
# Sampling Concepts and Normal Probability

#########################################################
# Uncomment the following to install packages
# do not be alarmed if R restarts a couple times. 
# install.packages("tigerstats")
# install.packages('pastecs')
# install.packages('nortest')

#########################################################
library(tigerstats)
library(pastecs)
library(nortest)

# As we are plotting the normal distribution, 
# you may find this additional resource useful, 
# https://mycourses.rit.edu/d2l/le/content/681461/viewContent/4841032/View

# Basic Statistics Continued
some_numbers = c(90, 84, 11, 49, 30, 91, 93, 54, 29, 82)
summary(some_numbers)
# More advanced summary statistics
stat.desc(some_numbers) 


############# Normal Distribution #######################
# Let's examine the shape of the curve for different standard
# deviations.
x <- seq(-10, 10, length=100)
hx <- dnorm(x, mean = 0, sd = 1)
plot(x, hx, type = 'l')
for (i in seq(1, 3.5, by = .1)) {
  hx1 <- dnorm(x, mean = 0, sd = i)  
  lines(x, hx1)
}

# Let's draw some numbers from a random distribution and 
# plot their histogram.

normal_numbers = rnorm(mean = 20, sd = 2, n = 1000)
hist(normal_numbers)

# CDF and PDF of Normal Distribution
pnormGC(20, mean=15, sd=6, region="above",graph=TRUE)

# This will be discussed in greater detail in the 
# continuous probability module later.


######## Additional Distributions #######################
# Exponential Distribution
?dexp
x <- seq(0, 4, length=100)
# Generate random numbers in the distribution
hx <- dexp(x, rate=.7)
plot(x, hx, type = 'l')
for (i in seq(.4, .7, by = .05)) {
  hx1 <- dexp(x, rate=i)  
  lines(x, hx1)
  }





