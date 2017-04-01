
library(maps)
library(mapproj)
source("RStudio - text lessons/Lesson5-census-app/helpers.R")
counties <- readRDS("RStudio - text lessons/Lesson5-census-app/data/counties.rds")
percent_map(counties$white, "darkgreen", "% White")