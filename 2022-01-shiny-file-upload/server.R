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

    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        #x    <- faithful[, 2]
        #bins <- seq(min(x), max(x), length.out = input$bins + 1)

        ## get uploaded file
        input_file <- reactive({
            if(is.null(input$file)){
                return("")
            }
            data <- read_csv(input$file$datapath)
        })
        # draw the histogram with the specified number of bins
        hist(data=input_file(), col = 'darkgray', border = 'white')

    })

})
