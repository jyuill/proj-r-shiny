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
library(here)
library(plotly)
library(DT)

## load data
mtc <- read_csv(here::here('8-cuisine-ingredients', 'mtc-data.csv'))

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
## reactive table - process once and apply to various outputs
    rval_top_cars <- reactive({
        mtc %>%
            filter(company==input$car_comp & carb<=input$n_carbs) %>%
            mutate(cars=forcats::fct_reorder(cars, carb))
    })
    ## create bar chart
    output$plot_top_cars <- plotly::renderPlotly({
        mtc_react <- rval_top_cars()
        mtc_react %>% ggplot(aes(x=cars, y=carb))+geom_col()+
            coord_flip()
    })
    ## create table for output
    output$dt_top_cars <- DT::renderDT({
        mtc_react <- rval_top_cars()
        mtc_react %>% arrange(desc(carb)) %>%
            select(company, cars, carb, gear, cyl, hp, qsec)
        #mtc %>%
         #   filter(company==input$car_comp & carb<=input$n_carbs) %>%
         #   arrange(desc(carb)) %>%
         #   select(company, cars, carb, gear, cyl, hp, qsec)
    })
     
})
