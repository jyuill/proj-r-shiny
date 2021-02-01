## UFO sightings interface

library(shiny)
library(tidyverse)
library(lubridate)
library(DT)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
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
