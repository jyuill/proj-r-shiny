#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# reactive output 
shinyServer(function(input, output) {
   
  output$text1 <- renderText({
   paste("You have selected this: ", input$var)
  })
  
  output$text2 <- renderText({
    paste("Range from: ", input$range[1], " to: ", input$range[2])
  })
})
