#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel(
    h1("Title: Building User Interface (H1 tag)", align="center")
    ),
  
  sidebarLayout(position="right",
    sidebarPanel(
      h3("Lesson 2 (H3)"),
      a("Build a user-interface", href="https://shiny.rstudio.com/tutorial/lesson2/")
      ),
    mainPanel(
      h2("Top Section (H2)"),
      p("First paragraph of text, created using 'p'."),
      p("Aonther paragraph, with text style formatting.",
        style="font-family:'tahoma'"),
      strong("Use strong() to make text in the brackets bold, while"),
      em("em() creates italized text in the brackets."),
      br(),
      br(),
      code("(space above created with 'br()' - but takes 2?). Use 'code' to display
           your text similar to computer code. (apparently red by default)"),
      div("'div' creates segments of text with a similar style. 
          This chunk of text is blue because of the argument 'style=color:blue' in the div",
          style="color:blue"),
      br(),
      p("(br() works as expected in line above) 'span' does same thing as div, but ",
        span("works with groups of words", style="color:green"),
        "that appear inside a paragraph."),
      h3("H3 Title"),
      p("Easy to add images, but they need to be in a folder called
 'www' in same directory as ui.R file. The www folder is treated in a special way
        and is good place for images, style sheets, and other things the browser will need
        to build the web components of the Shiny app."),
      img(src="masseffectandromeda.jpg", height=200, width=375),
      h4("Other HTML Tags (H4 Title)"),
      p("Other tags are available for use as well. Check this link for more info: "), 
      a("RStudio Guide to Customizing UI with HTML", href="https://shiny.rstudio.com/articles/html-tags.html"),
      h5("H5 Title - as far we need to go :)")
      
    )
  )
  
  
))
