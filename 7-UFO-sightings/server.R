# UFO Sightings 
# This is the server logic of a Shiny web application. 

library(shiny)
library(tidyverse)
library(lubridate)
library(DT)
library(here)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  ## not sure where this is best placed, maybe above shinyServer?
   ufo_data <- read_csv(here::here('7-ufo-sightings','ufo_sight_clean.csv'))
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
