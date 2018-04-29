# Welcome!
# An introduction to R
# Eilif Mikkelsen 2017 - MIT Liscense
# Data Sets used throughout these files
# https://archive.ics.uci.edu/ml/datasets/Concrete+Compressive+Strength
# https://archive.ics.uci.edu/ml/datasets/Wine+Quality
# https://archive.ics.uci.edu/ml/datasets/abalone

#########################################################
# Uncomment the following to install packages
# do not be alarmed if R restarts a couple times. 
# 

#########################################################

# In R, a function is something you can write that, when given the correct inputs
# provides a specific output to the user. If there is ever a function you don't know
# simply type ?<function name> to bring up the R help. You of course can also Google it!
?read.csv

# Load the abalone data from file
df = read.csv("datasets/abalone.csv", header = TRUE)

# Quick introduction to data.frames
# Examine the first several rows of data
head(df)

## Frequency Distributions
# Use the table function
sex.freq = table(df$Sex)

# Print it out
sex.freq

## Histogram
hist(df$Length)

hist(df$Whole.weight)

## Measures of Location
# Mean, Median, Mode, Percentiles, Quartiles
# Mean
hist(df$Shucked.weight)
mean(df$Shucked.weight)

# Median
median(df$Shucked.weight)

# A special function is required to get the mode
# don't worry about how this works for now
# Create a function to compute mode
compute_mode <- function(v) {
  uniq <- unique(v)
  uniq[which.max(tabulate(match(v, uniq)))]
}

compute_mode(df$Shucked.weight)

# Getting quartiles, mean, median, and max with the summary() function
summary(df$Shucked.weight)

## Measures of Variability
# Range
# If a dataset has missing values, we have to tell the functions to omit them from
# computation using na.rm=TRUE. There are no missing data points in these examples
# however I have included the usage as an example. 
range(df$Shucked.weight, na.rm=TRUE)

# Interquartile range
IQR(df$Shucked.weight, na.rm=TRUE)

# Variance
var(df$Shucked.weight, na.rm=TRUE)

# Standard Deviation
sd(df$Shucked.weight, na.rm=TRUE)

# Coefficient of variation
# Standard Deviation/ Mean
sd(df$Shucked.weight, na.rm=TRUE)/mean(df$Shucked.weight, na.rm=TRUE)

## Z Scores
# z = (x - pop_mean) / pop_sd
# Compute the population statistics from the sample
pop_mean = mean(df$Shucked.weight)
pop_sd = sd(df$Shucked.weight)

# Let's access the Shucked.weight value for the first row of the data. 
z = (df$Shucked.weight[1] - pop_mean) / pop_sd

# Covariance
# Covariance between Shucked.weight and Whole.weight
cov(ab$Shucked.weight, ab$Whole.weight)

# Correlation Coefficient
cor(ab$Shucked.weight, ab$Whole.weight)
# We see here that the correlation is nearly 1 indicating that they are 
# very correlated to eachother. This may be an issue later on. 

