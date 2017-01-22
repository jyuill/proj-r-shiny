

library(shiny)

ui <- fluidPage("Hello, this is a shiny app!",
                "That is all")

server <- function(input,output) {}

shinyApp(ui=ui, server=server)