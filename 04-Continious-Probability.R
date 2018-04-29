# Eilif Mikkelsen 2017 - MIT Liscense
# Data Sets used throughout these files
# https://archive.ics.uci.edu/ml/datasets/Concrete+Compressive+Strength
# https://archive.ics.uci.edu/ml/datasets/Wine+Quality
# https://archive.ics.uci.edu/ml/datasets/abalone
# https://archive.ics.uci.edu/ml/datasets/Auto+MPG
# Continious Probability

#########################################################
# Uncomment the following to install packages
# do not be alarmed if R restarts a couple times. 
# install.packages("tigerstats")
# install.packages('pastecs')

#########################################################

################ Uniform Distribution ###################
# Example Problem
# A random variable is uniformly distributed with 
# a minimum value of 1 and a max value of 3. 
# What is the probability that the value will be between
# 1.3 and 2.5. 

# First compute the probability that the value will be at least
# 1.3
lower_bound = punif(1.3, max= 3, min = 1)
upper_bound = punif(2.5, max= 3, min = 1)

# Probability of being between these values is
# the difference between their probabilities. 

upper_bound - lower_bound

# Similarly, the probability of getting a value
# greater than 2.5 is 1 - P[X < 2.5]

1 - upper_bound


################### Normal Distribution #################
# Example Problem 1
# A factory makes rods that must meet customer quality
# standards. On average, the length of the rods is 1.45 meters
# with a standard deviation of .1 meters. If the factory makes
# 1000 rods per day, how many will be over 1.6 meters?

mu = 1.45
stdev = .1

p_gt = pnormGC(1.6, mean=1.45, sd=.1, region="above",graph=TRUE)

# We multiply the probability by 1000 to get the expected number of rods
# daily. 
p_gt * 1000

# Example Problem 2
# The diameter of a critical component has a mean of 10 cm,
# a standard deviation of .05, and is known to be normally 
# distributed. Out of 8000 parts, 4% are discarded for having a
# diameter that is too large. What is the diameter threshold?

mu = 10
stdev = .05
n = 8000

threshold = qnormGC(.04, mean = mu, sd = stdev, region = 'above', graph = TRUE)


