# Eilif Mikkelsen 2017 - MIT Liscense
# Data Sets used throughout these files
# https://archive.ics.uci.edu/ml/datasets/Concrete+Compressive+Strength
# https://archive.ics.uci.edu/ml/datasets/Wine+Quality
# https://archive.ics.uci.edu/ml/datasets/abalone
# Point and Interval Estimation

#########################################################
# Uncomment the following to install packages
# do not be alarmed if R restarts a couple times. 

#########################################################
library(tigerstats)
library(pastecs)

# We will work with the Abaolne data set for these examples
ab = read.csv('datasets/abalone.csv')

# Examine column names
names(ab)

################# Confidence Intervals ##################
# Confidence Intervals for Estimation of the Mean Height
# Population Standard Deviation Known

# Compute the mean
mu = mean(ab$Height)

# sdev/variance must be provided by an authoratative source
sdev  = .041

nobs = 10

alpha = .05

# Compute margin of error
MEnorm = qnorm(alpha/2,lower.tail=FALSE)*sdev/sqrt(nobs)
MEnorm
uppernorm = mu + MEnorm
lowernorm = mu - MEnorm

# Population Standard Deviation Unknown
# Here we will use the T Distribution rather than the
# Normal Distribution


s = sd(ab$Height)

MET = qt(alpha/2, df=nobs-1,lower.tail = FALSE)*s/sqrt(nobs) #USING T DIST
upperT = mu + MET
lowerT = mu - MET

# Let's look at the ranges of the intervals
# Notice that the T distribution is wider 
# as we have less certianty of the underlying distribution
uppernorm - lowernorm
upperT - lowerT





