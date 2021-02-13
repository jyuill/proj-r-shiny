## using mtcars instead of recipe ingredient data since not handy

library(tidyverse)

## get mtcars
mtc <- mtcars
mtc$cars <- row.names(mtc)

## company field for classification
comp_names <- data.frame(company=c('Mazda','Toyota','Dodge','Ford','GM','Europe'),
                         identify=c('mazda','datsun|toyota|honda','dodge|hornet|valiant|duster|chrysler|amc','merc|lincoln|ford','cadillac|camaro|pontiac','fiat|porsche|lotus|ferrari|maserati|volvo'),
                         stringsAsFactors = FALSE)

## test
#mtc$cars[which(grepl(comp_names[1,2], mtc$cars, ignore.case=TRUE))]
#mtc$company <- NA
#mtc$company[which(grepl(comp_names[1,2], mtc$cars, ignore.case=TRUE))] <- comp_names[1,1]


## loop through 
mtc$company <- NA
for(c in 1:nrow(comp_names)){
  mtc$company[which(grepl(comp_names[c,2], mtc$cars, ignore.case=TRUE))] <- comp_names[c,1]
}

write_csv(mtc, '8-cuisine-ingredients/mtc-data.csv')
