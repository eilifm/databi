# Eilif Mikkelsen 2017 - MIT Liscense
# Data Sets used throughout these files
# https://archive.ics.uci.edu/ml/datasets/Concrete+Compressive+Strength
# https://archive.ics.uci.edu/ml/datasets/Wine+Quality
# https://archive.ics.uci.edu/ml/datasets/abalone
# https://archive.ics.uci.edu/ml/datasets/Auto+MPG
# ANOVA

#########################################################
# Uncomment the following to install packages
# do not be alarmed if R restarts a couple times. 

#########################################################
# We will work with the Abaolne data set for these examples
ab = read.csv('datasets/abalone.csv')

####################### Boxplot ##########################
# let's examine Whole.weight of the Abalone as it varies
# by sex. Note that not all of the samples were identified 
# as either Male or Female.
boxplot(Whole.weight ~ Sex, data=ab, ylab="Whole Weight", xlab="Sex")

####################### ANOVA ############################
# ANOVA, or Analysis of Variance is a method to conclude wether
# variation in data can be attributed to a specific factor. 
# It is a precursor to linear regression.
fit1 <- aov(Whole.weight ~ Sex, data = ab)
summary(fit1)

# ANOVA can invlude as many variables as you like. 
# Let's try with two. 
fit2 <- aov(Whole.weight ~ Sex + Length, data = ab)
summary(fit2)
