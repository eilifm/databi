# Eilif Mikkelsen 2017 - MIT Liscense
# Data Sets used throughout these files
# https://archive.ics.uci.edu/ml/datasets/Concrete+Compressive+Strength
# https://archive.ics.uci.edu/ml/datasets/Wine+Quality
# https://archive.ics.uci.edu/ml/datasets/abalone
# https://archive.ics.uci.edu/ml/datasets/Auto+MPG
# Additional Types of Hypothesis Tests

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


########## Testing For Normality #######################
# We will use the Anderson-Darling Test for Normality
# In this case, the alternative hypothesis is that the date
# is NOT normally distributed. This means that often you "want"
# the test to "fail".

# Let's look at what happens when we enter normally distributed data
ad.test(rnorm(100, mean = 5, sd = 3))

# Let's see what happens when we enter uniformly distributed data
ad.test(runif(100, min = 2, max = 4))


