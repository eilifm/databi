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
df = read.csv("datasets/auto-mpg.csv", header = TRUE)

# Quick introduction to data.frames
# Loaded data is held in something called a data.frame. Things of this as a row/column table of the data
# in the computer. 
# Examine the first several rows of data
head(df)

# R data can be selected by position in the table
# Here we will select the first row and then the first column
df[1,]

df[,1]

# We can also access the data by column name
df$displacement

# These selections can be passed to other functions. 
# Let's find the mean of the displacement

mean(df$displacement)

########### Conditional Selection ##########
# Selecting rows in df where the cylinders > 6
df[which( df$cylinders > 6),]

# Selecting rows where the horsepower is between 150 and 200
df[which( df$horsepower >= 150 & df$horsepower < 200 ),]

# Using conditional subsets
# Let's take two groups of samples split up by horsepower and compare their mpg
subset1 = df[which( df$horsepower < 150),]
subset2 = df[which(df$horsepower > 200 ),]

mean(subset1$mpg)
mean(subset2$mpg)

# Whoa, more horsepower tends to have worse mileage!

################ Functions ###################
# You will not need to do this but one can write their own 
# functions to process data in R. 
# This does demonstrate how all functions work in R. 
# All functions take a set of inputs called "arguments",
# do something, and return a response. We can store that response
# in a variable for use later. 

compute_col_means = function (data) {
  numerics = unlist(lapply(data, is.numeric))
  return(colMeans(data[, numerics]))
}

# We've been doing this already in the document but
# here we will assign the col_means name to the output
# of the compute_col_means function.
col_means = compute_col_means(df)

col_means
# Notice that the values have names. We can use these names to access the values on command. 

############### Looping ########################
# Loop through all the values and divide them by sqrt(2)
for (col_name in names(col_means)) {
    print(col_means[col_name]/sqrt(2))
}
