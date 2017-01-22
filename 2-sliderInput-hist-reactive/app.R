
library(shiny)

# Create slider input
ui <- fluidPage(
  sliderInput(inputId="slider",
              label="Pick a Numbah! (to determine how many random observations)",
              min=1,max=20,value=10),
  plotOutput("hist"),
  verbatimTextOutput("stats")
)

server <- function(input,output) {
  data <- reactive({
    rnorm(input$slider, mean=50, sd=10)
  })
  output$hist <- renderPlot({
    hist(data())
  })
  output$stats <- renderPrint({
    summary(data())
  })
}

shinyApp(ui=ui, server=server)

