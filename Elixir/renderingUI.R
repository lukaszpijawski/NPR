createUI <- function()
{
  fluidPage(includeCSS("style.css"),
            
            titlePanel(
              h3(
                "Zlecenia klientowskie zrealizowane na rachunkach bieżących banków w NBP DSP w 2017 r."
              )
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
              ))
            ),
            tabPanel(
              "Zestawienie wspólne",
              fluidPage(fluidRow(
                column(4,uiOutput(outputId = "orderTypes_2")),
                column(8,plotlyOutput("distPlot_2"))
              ))
              )
            ))
}

createCheckboxes <- function(yearInNumber, ListOfYears)
{
    year = ListOfYears[[yearInNumber - 1998]]
    rows <- rownames(year)
    print(rows)
    checkboxGroupInput(label = h4("Typy zleceń"), choices = rows)
}