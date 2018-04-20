# Eilif Mikkelsen 2017 - MIT Liscense
# Data Sets used throughout these files
# https://archive.ics.uci.edu/ml/datasets/Concrete+Compressive+Strength
# https://archive.ics.uci.edu/ml/datasets/Wine+Quality
# https://archive.ics.uci.edu/ml/datasets/abalone
# Sampling Concepts and Normal Probability

#########################################################
# Uncomment the following to install packages
# do not be alarmed if R restarts a couple times. 
# install.packages("tigerstats")

#########################################################
library(tigerstats)

# As we are plotting the normal distribution, 
# you may find this additional resource useful, 
# https://mycourses.rit.edu/d2l/le/content/681461/viewContent/4841032/View

pnormGC(20,mean=15,sd=6,region="above",graph=TRUE)

x <- seq(0, 4, length=100)
hx <- dexp(x, 1)
plot(x, hx)
