## get data for use in shiny
## not able to figure out how to access the data directly from within app
## so...need to:
## 1. create a file to import data into environment
## 2. source this file from ui.R

library(tidyverse)
library(here)

ufo_data <- read_csv(here::here('7-UFO-sightings','ufo_sight_clean.csv'))