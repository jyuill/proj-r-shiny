#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.

library(shiny)
library(shinydashboard)

header <- dashboardHeader(
    dropdownMenu(
        type='messages',
        messageItem(
            from='Lucky',
            message='View the International Space Station',
            href='https://spotthestation.nasa.gov/sightings/'
        ),
        messageItem(
            from='John',
            message='Check the FAQs for more',
            href='https://spotthestation.nasa.gov/faq.cfm'
        )
    ),
    dropdownMenu(
        type='notifications',
        notificationItem(
            text='ISS Overhead!'
        )
    )
)

sidebar <- dashboardSidebar(
    sidebarMenu(
        menuItem("Data",
                 tabName='data'),
        menuItem("Dashboard",
                 tabName='dashboard')
    )
)
body <- dashboardBody(
    tabItems(
        tabItem(tabName='data',
                'Input data here'),
        tabItem(tabName='dashboard',
                'Cool dashboard here')
    )
)

ui <- dashboardPage(header, sidebar, body)