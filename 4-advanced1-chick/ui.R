#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(tidyverse)
library(shiny)

## right now only works when this code is here and server.R
## (can be solved by using separate file and calling with 'source' from ui.R)
chw <- ChickWeight
chw.sel <- chw %>% filter(Chick=="1"|Chick=="2"|Chick=="3"|Chick=="4"|Chick=="5")
multi <- rnorm(length(chw.sel$weight),0,1)
chw.sel <- chw.sel %>% mutate(other=weight*multi)
####

# Define UI for application 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Chick Weight Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("chick",
                  label="Select Chicks",
                  choices=unique(chw.sel$Chick),
                  selected=unique(chw.sel$Chick)[2:3],
                  multiple = TRUE),
      
      sliderInput(inputId="time",label="Select Time Range",
                  min=0, max=25, value=c(0,10)
        
      )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("chwPlot"),
       plotOutput("chwPlot2")
    )
  )
))
