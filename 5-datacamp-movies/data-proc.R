## DATA COLLECTION, PROCESSING, ORGANIZING FOR SHINY APP

library(tidyverse)
library(ggplot2movies)

mov <- movies
#head(mov)
## generate some random numbers to use as row references: round(runif(10, min=1, max=nrow(mov)))
#mov[round(runif(10, min=1, max=nrow(mov))), ]
# sample(mov, 10, replace=FALSE) ## generates a sample of 10 rows and 10 columns
## random sample -> same idea as above
#mov[sample(nrow(mov), 10, replace=FALSE),]

#str(mov)

#summary(mov)
## test plots
#ggplot(mov, aes(x=r1, y=rating))+geom_point()
