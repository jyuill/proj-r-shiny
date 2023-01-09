#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)
library(shinythemes)

source('data-proc.R')

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Movies"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       # sliderInput("bins",
       #             "Number of bins:",
       #             min = 1,
       #             max = 50,
       #             value = 30)
       
      # Select variable for x-axis
      selectInput(inputId = "x", 
                  label = "X-axis:",
                  choices = c("r1", "r2", "r3", "r4"), 
                  selected = "r1"),
      
       # Select variable for y-axis
       selectInput(inputId = "y", 
                   label = "Y-axis:",
                   choices = c("rating", "votes"), 
                   selected = "rating")
       
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("ratingsPlot"),
       # Show data table
       dataTableOutput(outputId = "moviestable"),
       br()
    )
  )
))
