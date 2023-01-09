## UFO sightings interface

library(shiny)
library(tidyverse)
library(lubridate)
library(DT)
library(shinythemes)

## get data - need to source a data import file from ui.R
#ufo_data <- read_csv(here::here('7-UFO-sightings','ufo_sight_clean.csv'))
source(here::here('7-UFO-sightings','get-data-for-shiny.R'))

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme=shinytheme('readable'),
  
  # Application title
  titlePanel("UFO Sightings"),
  
  # Sidebar  
  sidebarLayout(
    sidebarPanel(
       selectInput('state','Choose State', unique(ufo_data$state)),
       dateRangeInput('dtrng','Choose date range',start='1960-01-01', end='2019-12-31')
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("ufoPlot")
    )
  )
))
