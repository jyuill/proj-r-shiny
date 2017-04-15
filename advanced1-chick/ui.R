#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Chick Weight Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("chick",
                  label="Select Chicks",
                  choices=unique(chw.sel$Chick),
                  selected=unique(chw.sel$Chick)[2:3],
                  multiple = TRUE)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("chwPlot"),
       plotOutput("chwPlot2")
    )
  )
))
