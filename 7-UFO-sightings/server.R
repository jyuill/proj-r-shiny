# UFO Sightings 
# This is the server logic of a Shiny web application. 

library(shiny)
library(tidyverse)
library(lubridate)
library(DT)
library(here)

## data is obtained by sourcing a data file from ui.R

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  ## Reactive expression to filter based on inputs
   rval_ufos <- reactive({
     ufos <- ufo_data %>% filter(state==input$state & date>= input$dtrng[1] & date<=input$dtrng[2]) %>%
       group_by(shape) %>% summarize(sightings=n())
   })
   ## bar chart
   output$ufoPlot <- renderPlot({
    rval_ufos() %>% ggplot(aes(x=shape, y=sightings))+geom_col()
     ## this works without reactive expressions - fixing filter variables for ufos 
     #ggplot(ufos, aes(x=shape, y=sightings))+geom_col()
    
  })
  
})
