#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
# TO BUILD SHINY APP SAVE THIS FILE AS 'server.R' in your app folder

library(shiny)
## code that you only want to run ONCE goes here
source("helpers.R")
counties <- readRDS("data/counties.rds")
library(maps)
library(mapproj)


# Define server logic 
shinyServer(function(input, output) {
  ## code that you want to run each time a user visits the app goes here
  
  
  ## output code that you want to run each time a user changes a widget goes here
  output$map <- renderPlot({
    data <- switch(input$var,
                   "Percent White"=counties$white,
                   "Percent Black"=counties$black,
                   "Percent Hispanic"=counties$hispanic,
                   "Percent Asian"=counties$asian)
    
    percent_map(var=data, color="dark orange", legend.title = input$var, min=input$range[1], max=input$range[2] )
  })
})
