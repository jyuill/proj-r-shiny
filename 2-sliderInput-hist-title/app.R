### sliderinput-histogram

library(shiny)

# Create slider input
ui <- fluidPage(
  sliderInput(inputId="slider",
              label="Pick a Numbah! (to determine how many random observations)",
              min=1,max=20,value=10),
  textInput(inputId="title",
            label="Provide a title",
            value="Histogram of Random Normal Values"),
  plotOutput("hist")
  )

server <- function(input,output) {
  output$hist <- renderPlot({
    hist(rnorm(input$slider,mean=50,sd=5),
         main=input$title)
  })
}

shinyApp(ui=ui, server=server)

