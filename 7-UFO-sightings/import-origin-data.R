## IMPORT DATA

library(tidyverse)
library(lubridate)

ufo_sight <- read_csv('https://query.data.world/s/5dyykv6q6ekfqx2fxyl3cuntqm4vlr')

## Clean, remove unneeded fields in order to drastically reduce size while keeping same number of records
ufo_clean <- ufo_sight %>% select(city, state, date_time, shape)
ufo_clean$date <- as.Date(ufo_clean$date_time)
ufo_clean <- ufo_clean %>% select(-date_time)

## check date range
summary(ufo_clean)

write_csv(ufo_clean, '7-UFO-sightings/ufo_sight_clean.csv')
