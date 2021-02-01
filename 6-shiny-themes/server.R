#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(DT)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  df_ff <- data.frame(faithful)
  
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    #x    <- faithful[, 2] 
    #x <- df_ff$waiting
    #bins_ns <- seq(min(x), max(x), length.out = input$bins_n + 1)
    bins_n <- input$bins
    
    # draw the histogram with the specified number of bins
    #hist(x, breaks = bins, col = 'darkgray', border = 'white')
    ggplot(data=df_ff, aes(x=eruptions))+geom_histogram(bins=bins_n)+
      labs(title='Eruptions')
    
  })
  
  output$distW <- renderPlot({
    bins_n <- input$bins
    ggplot(data=df_ff, aes(x=waiting))+geom_histogram(bins=bins_n)+
      labs(title='Waiting')
    
  })
  
})
