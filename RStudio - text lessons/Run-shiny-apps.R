## R file to run shiny apps - using examples from R Studio text lessons

library(shiny)

## use path from project working directory
## Lesson 1: Basic Histogram
runApp("RStudio - text lessons/Lesson1-histogram")
## Lesson 2: HTML
runApp("RStudio - text lessons/Lesson2-html")
## Lesson 3: Control Widgets
runApp("RStudio - text lessons/Lesson3-control-widgets")
## Lesson 4: Reactive Output
runApp("RStudio - text lessons/Lesson4-reactive-output", 
       display.mode = "showcase")
