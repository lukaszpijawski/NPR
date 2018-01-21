createUI <- function()
{
  fluidPage(includeCSS("style.css"),
            #actionButton("Uncheck", label="Odznacz"),
            titlePanel(
                "Zlecenia klientowskie zrealizowane na rachunkach bieżących banków w NBP DSP."
            ),
            
            tabsetPanel(tabPanel(
              "Zestawienie latami",
              fluidPage(fluidRow(
                column(4,
                       fluidPage(fluidRow(
                         column(
                           12,
                           sliderInput(
                             inputId = "inputYear",
                             label = "Wybór roku:",
                             min = 1999,
                             max = 2017,
                             value = 1999,
                             sep = ""
                           )
                         )
                       ),
                       fluidRow(
                         column(12,
                                uiOutput(outputId = "orderTypes"))
                       ))),
                column(8,
                       plotlyOutput("distPlot"))
              ), fluidRow(column(12,actionButton("Uncheck_1", label="Odznacz"))))
            ),
            tabPanel(
              "Zestawienie wspólne",
              fluidPage(fluidRow(
                column(4,uiOutput(outputId = "orderTypes_2")),
                column(8,plotlyOutput("distPlot_2"))
              ), fluidRow(column(12,actionButton("Uncheck_2", label="Odznacz"))))
              )
            ))
}