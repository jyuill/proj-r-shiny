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

library(dplyr)
library(ggplot2)

chw <- ChickWeight
chw.sel <- chw %>% filter(Chick=="1"|Chick=="2"|Chick=="3"|Chick=="4"|Chick=="5")
multi <- rnorm(length(chw.sel$weight),0,1)
chw.sel <- chw.sel %>% mutate(other=weight*multi)

shinyServer(function(input, output) {
  
  data <- reactive({
    chw %>% filter(Chick==input$chick)
  })
  
  output$chwPlot <- renderPlot({
    ggplot(data(), aes(x=Time, y=weight))+geom_bar(stat="identity")+
      facet_grid(.~Chick)
   
  })
  
})
