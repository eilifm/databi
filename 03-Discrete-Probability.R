# Eilif Mikkelsen 2017 - MIT Liscense
# Data Sets used throughout these files
# https://archive.ics.uci.edu/ml/datasets/Concrete+Compressive+Strength
# https://archive.ics.uci.edu/ml/datasets/Wine+Quality
# https://archive.ics.uci.edu/ml/datasets/abalone
# https://archive.ics.uci.edu/ml/datasets/Auto+MPG
# Discrete Probability

#########################################################
# Uncomment the following to install packages
# do not be alarmed if R restarts a couple times. 
# install.packages("tigerstats")
# install.packages('pastecs')

#########################################################

##################### Coin Flip #########################
# The flip of a fair coin is a classic example of discrete
# probability. We know that a fair coin will land on heads
# and tails with equal proportion. Given enough trials
# one should observe this phenomenon. 

# Let's simulate a fair coin
options = c("H","T")
samples = sample(options, 100000, replace = T)

cnt_T = sum(samples == "T")
cnt_H = sum(samples == "H")

# When we examine the number of heads and tails
# we see that they are very close to evenly split
cnt_H
cnt_T



## An unfair coin
# Let's say that the coin was rigged to land on heads 60% of 
# the time. 
unfair_samples = sample(options, 100000, replace = T, prob = c(.6, .4))

unfair_cnt_T = sum(unfair_samples == "T")
unfair_cnt_H = sum(unfair_samples == "H")

# As before, the values won't be exactly the weights
# but we can clerly observer that heads is occuring 
# nearly 60% of the time. 
unfair_cnt_H
unfair_cnt_T

## Knowing your odds -- Binomial Distribution
