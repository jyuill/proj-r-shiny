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
library(plotly)
library(gapminder)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    ## create reactive function to hold filtered data
    ## can then be used in multiple places
    ## examples below of before and after reactive
    filtered_data <- reactive({
        data <- gapminder %>% filter(
            year>=input$years[1] & year<=input$years[2]
        )
        data <- subset(
            data,
            lifeExp>=input$life[1] & lifeExp<=input$life[2]
        )
        if(input$conti!='All'){
            data <- subset(
                data,
                continent==input$conti
            )
        }
        data
    })
    ## histogram
    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        gm    <- gapminder
        #binsn <- seq(min(x$waiting), max(x$waiting), length.out = input$bins + 1)
        binsnum <- input$bins
        ## BEFORE REACTIVE
        # draw the histogram with the specified number of bins
        #hist(x, breaks = bins, col = 'darkgray', border = 'white')
        # gapminder %>% filter(year>=input$years[1] & year<=input$years[2]) %>% 
        #     ggplot(aes(x=lifeExp))+
        #     geom_histogram(bins = binsnum)+
        #     facet_grid(year~.)+
        #     labs(title='Life Expectancy Distribution')
        ## AFTER REACTIVE
        filtered_data() %>% 
            ggplot(aes(x=lifeExp))+
            geom_histogram(bins = binsnum)+
            facet_grid(year~.)+
            labs(title='Life Expectancy Distribution')
    })
    ## Scatterplot
    ## BEFORE REACTIVE - not filtered
    output$scatPlot <- renderPlotly({
        #p <- gapminder %>% ggplot(aes(x=gdpPercap, y=lifeExp))+
        #    geom_point()+scale_x_log10()
        #ggplotly(p)
        ## AFTER REACTIVE
        data <- filtered_data()
        ggplotly(
            data %>% ggplot(aes(x=gdpPercap, y=lifeExp))+
                geom_point()+scale_x_log10()
        )
    })
    
    ## table output
    ## convert to DT (convention is to use DT::)
    output$tbl <- DT::renderDataTable({
        ## before reactive variable above
        # data <- subset(
        #     gapminder,
        #     lifeExp>=input$life[1] & lifeExp<=input$life[2]
        # )
        # if(input$conti!='All'){
        #     data <- subset(
        #         data,
        #         continent==input$conti
        #     )
        # }
        # data
        ## after reactive variable
        filtered_data()
    })
    output$downloader <- downloadHandler(
        filename='gm.csv',
        content=function(file){
            data <- filtered_data()
            ## can put filters in here corresponding to filters
            ## in interface (left out for simplicity)
            write_csv(data, file)
        }
    )

})
