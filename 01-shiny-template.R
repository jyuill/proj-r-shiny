### BASIC TEMPLATE FOR SHINY APPS (SINGLE FILE APPS)
## copy/paste into new file for shiny app
## make sure the new file is in its own folder

library(shiny)

ui <- fluidPage()

server <- function(input,output) {}

shinyApp(ui=ui, server=server)