#
#Authors: Jakub Kaliszewski, Jędrzej Kołecki, Łukasz Pijawski
#

library(shiny)
library(plotly)

source("renderingUI.R")
ui <- createUI()

server <- function(input, output) 
{
  source("functions.R")
  rows_99_02 <- getRows_99_02()
  rows_03_12 <- getRows_03_12()
  rows_13_17 <- getRows_13_17()
  ListOfYears <- getListOfYears(rows_99_02, rows_03_12, rows_13_17)
  
  output$orderTypes <- renderUI({
    year = ListOfYears[[input$inputYear - 1998]]
    rows <- rownames(year)
    rowNames <- getLongNames(rows)
    #print(names(year))
    checkboxGroupInput(inputId = "orderTypesCheckboxes", label = h4("Typy zleceń"), choiceNames = rowNames, choiceValues = rows, selected = rows[[1]])
  })

  output$distPlot <- renderPlotly(createPlot(input$inputYear, input$orderTypesCheckboxes, ListOfYears))
}

shinyApp(ui = ui, server = server)