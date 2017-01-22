
library(shiny)

# Create slider input
?sliderInput
ui <- fluidPage(sliderInput(inputId="slider",label="Pick a Numbah!",1,20,10))

server <- function(input,output) {}

shinyApp(ui=ui, server=server)

