#
# https://shiny.rstudio.com/tutorial/lesson4/

library(shiny)

# reactive output

shinyUI(fluidPage(
  titlePanel("censusVis"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create demographic maps with info from 2010 Census."),

      selectInput("var",
                  label="Choose a variable to display",
                  choices=c("Percent White","Percent Black",
                            "Percent Asian", "Percent Hispanic"),
                  selected="Percent Asian"),
      
      sliderInput("range",
                  label="Range of interest:",
                  min=0, max=100, value=c(0,100))
    ),
    
    mainPanel(
      textOutput("text1"),
      textOutput(("text2"))
    )
  )
))