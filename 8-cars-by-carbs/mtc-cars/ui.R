#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(plotly)
library(DT)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("MTCars"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput('car_comp','Select car company', unique(mtc$company)),
            sliderInput('n_carbs','Select # of carbs',1,8,4)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(
                tabPanel('Plot', plotly::plotlyOutput('plot_top_cars')),
                tabPanel('Table', DT::DTOutput('dt_top_cars'))
            )
        )
    )
))
