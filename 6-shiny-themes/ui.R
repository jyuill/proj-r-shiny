#
# This is the user-interface definition of a Shiny web application. 
# Find out more about building applications with Shiny here: http://shiny.rstudio.com/

library(shiny)
library(shinythemes)
library(tidyverse)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Old Faithful Geyser Data"),
  #shinythemes::themeSelector(),
  theme=shinytheme('superhero'),
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("bins",
                   "Number of bins:",
                   min = 1,
                   max = 50,
                   value = 30)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel('Eruptions',
                 plotOutput("distPlot")
                 ),
        tabPanel('Waiting',
                 plotOutput("distW")
        )
      )
    )
  )
))
