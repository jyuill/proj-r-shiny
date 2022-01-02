# Find out more about building applications with Shiny here:
#    http://shiny.rstudio.com/

library(shiny)
library(tidyverse)
library(plotly)

## add CSS stylings - uses ids already in code
my_css <- "
 #downloader {
 background: orange;
 font-size: 20px;
 }
 #tbl {
 color: blue;
 }
"
# Define UI for application
shinyUI(fluidPage(
    ## refer to CSS - will find ids and apply
    tags$style(my_css),
    # Application title
    titlePanel("Gapminder Data: demonstration of Shiny techniques"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput(inputId="bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30),
            sliderInput(inputId='years',
                        label='Select range of yrs',
                        dragRange = TRUE,
                        value=c(1987, 2007),
                        min=1952,
                        max=2007
                        ),
            sliderInput(inputId='life',
                        label='Life expectancy',
                        dragRange=TRUE,
                        min=10, max=100,
                        value=c(40,80)),
            selectInput(inputId='conti',
                        label='Continent',
                        choices=c('All',levels(gapminder$continent))),
            downloadButton(outputId = 'downloader', label='Download')
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput(outputId="distPlot", width=400, height=400),
            plotlyOutput(outputId='scatPlot'),
            DT::dataTableOutput(outputId='tbl')
        )
    )
))
