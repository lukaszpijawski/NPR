## ui.R ##
library(shiny)
ui<-fluidPage(
  sidebarLayout(
    sidebarPanel(
    ),
    mainPanel(
      sliderInput("bins", "Number of observations:", min = 1, max = 500, value = 100)
      plotOutput(outputId = "distPlot")
  )
  )
)
