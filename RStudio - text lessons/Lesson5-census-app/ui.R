#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
# TO BUILD SHINY APP SAVE THIS FILE AS 'ui.R' in your app folder

library(shiny)

## Define UI for shiny app
shinyUI(fluidPage(
  
  ## Application title
  titlePanel("censusVis"),
  
  ## Layout with Sidebar and Main panel
  
  sidebarLayout(
    ## Sidebar
    sidebarPanel(
      helpText("Create demographic maps with info from 2010 US Census."),
      
      selectInput("var",
                  label="Choose variable to display",
                  choices=c("Percent White","Percent Black",
                            "Percent Hispanic", "Percent Asian"),
                  selected="Percent White"),
      sliderInput("range",
                  label="Range of interest:",
                  min=0, max=100, value=c(25,75))
       
    ),
    
    # Main panel
    mainPanel(plotOutput("map")
       
    )
  )
))
