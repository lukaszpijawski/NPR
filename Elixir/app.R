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
  values <- reactiveValues(checkbox = c())
  rows_99_02 <- getRows_99_02()
  rows_03_12 <- getRows_03_12()
  rows_13_17 <- getRows_13_17()
  ListOfYears <- getListOfYears(rows_99_02, rows_03_12, rows_13_17)
  
  ##Zestawienie latami##
  
  output$orderTypes <- renderUI({
    year = ListOfYears[[input$inputYear - 1998]]
    rows <- rownames(year)
    rowNames <- getLongNames(rows)
    checkboxGroupInput(inputId = "orderTypesCheckboxes", label = h4("Typy zleceń"), choiceNames = rowNames, choiceValues = rows, selected = input$orderTypesCheckboxes)
  })
  
  output$distPlot <- renderPlotly(createBarPlot(input$inputYear, input$orderTypesCheckboxes, ListOfYears))
  
  ##Zestawienie wspólne##
  
  output$orderTypes_2 <- renderUI({
    year = ListOfYears[[input$inputYear - 1998]]
    rows <- rownames(year)
    rowNames <- getLongNames(rows)
    checkboxGroupInput(inputId = "orderTypesCheckboxes_2", label = h4("Typy zleceń"), choiceNames = rowNames, choiceValues = rows,selected = input$orderTypesCheckboxes_2)
  })
  
  output$distPlot_2 <- renderPlotly(createLinePlot(input$inputYear, input$orderTypesCheckboxes_2, ListOfYears))
}

shinyApp(ui = ui, server = server)