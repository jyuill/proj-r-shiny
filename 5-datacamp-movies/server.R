#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$ratingsPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    #x    <- faithful[, 2] 
    #x <- mov
    #bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    ggplot(mov, aes_string(x=input$x, y=input$y))+geom_point()
    
  })
  
  # Create data table
  output$moviestable <- DT::renderDataTable({
    brushedPoints(mov, brush = input$plot_brush) %>% 
      select(title, year, rating)
  })
  
})
