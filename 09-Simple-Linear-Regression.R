# Eilif Mikkelsen 2017 - MIT Liscense
# Data Sets used throughout these files
# https://archive.ics.uci.edu/ml/datasets/Concrete+Compressive+Strength
# https://archive.ics.uci.edu/ml/datasets/Wine+Quality
# https://archive.ics.uci.edu/ml/datasets/abalone
# Simple Linear Regression

#########################################################
# Uncomment the following to install packages
# do not be alarmed if R restarts a couple times. 
# install.packages('BSDA')

#########################################################
library(tigerstats)
library(pastecs)
library(BSDA)

# We will work with the Abaolne data set for these examples
ab = read.csv('datasets/Abalone.csv')

# We will fit a line to the relationship between
# diameter and length of the Abalone
x = ab$Diameter
y = ab$Length

# Always plot your data
plot(x, y, xlab = "Diameter", ylab = "Length", main = "Abalone Diameter vs. Length")

# We will use the built in linear regression function lm
# The primary argument to lm is the "formula" specifying the relationship
# between variables. 

lm1 = lm(y ~ x)
summary(lm1)
plot(x,y)
abline(lm1, col="blue", lwd=3)

pairs(cmt, lower.panel = NULL)
