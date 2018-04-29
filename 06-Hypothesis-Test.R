# Eilif Mikkelsen 2017 - MIT Liscense
# Data Sets used throughout these files
# https://archive.ics.uci.edu/ml/datasets/Concrete+Compressive+Strength
# https://archive.ics.uci.edu/ml/datasets/Wine+Quality
# https://archive.ics.uci.edu/ml/datasets/abalone
# https://archive.ics.uci.edu/ml/datasets/Auto+MPG
# Hypothesis Testing

#########################################################
# Uncomment the following to install packages
# do not be alarmed if R restarts a couple times. 
# install.packages('BSDA')

#########################################################
library(tigerstats)
library(pastecs)
library(BSDA)

# We will work with the Abaolne data set for these examples
ab = read.csv('datasets/abalone.csv')

# Examine column names
names(ab)


################ Hypothesis Testing ######################

## Single Sample Hypothesis Testing
# Z tests less frequently used so the BSDA package is required
# We will use the Diameter of the Abalone dataset


true_mu = mean(ab$Diameter)

# If you peeked at the mean of the data you will observer that the
# mean is around .4. To understand what these hypothesis tests are doing,
# let's test wether it's possible for the mean of the data to be
# greater than .5.
z.test(ab$Diameter, y=NULL, mu=.5, alternative="greater", sigma.x=sd(ab$Diameter))

# At a p-value of 1 we do not have enough evidence to reject the null hypothesis
# that the true mean is greater than .5 in the Z test

# When we run the converse case we find that there is evidence to reject the 
# null and accept that the true mean is less than .5. Makes sense. 
z.test(ab$Diameter, y=NULL, mu=.5, alternative="less", sigma.x=sd(ab$Diameter))


# The T test is far more common than the Z test and is built into R

t.test(ab$Diameter, y=NULL, mu=.5, var.equal=TRUE, alternative="greater")

## Two-Sample Hypothesis Testing (T Testing)

# The Abalone dataset has male and female samples
# We will examine wether or not the two sexes of
# Abalone have the same mean whole weight

# To make things simpler here we will create a subset of the original
# data.frame containing the male and female samples. We will also select only
# the first 500 rows to equalize the sample size.

mf_data = ab[ which(ab$Sex == 'M' | ab$Sex == 'F'), ][1:500,]

t.test(mf_data$Whole.weight ~ mf_data$Sex, var.equal=FALSE)

# Reject the null and can conclude that the difference in mean
# Whole.weight between male and female abalone is not zero. 


