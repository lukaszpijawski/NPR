#
#A

library(shiny)
library(plotly)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Old Faithful Geyser Data"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("bins",
                     "Number of bins:",
                     min = 1,
                     max = 50,
                     value = 30)
      ),
      
      
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
  
  row_99_02 <- c("L_MB", "L_KDPW", "L_NBP", "L_razem",
                 "W_MB","W_KDPW", "W_NBP", "W_razem",
                 "S_MB", "S_KDPW", "S_NBP", "S_razem")
  
  row_03_12 <- c("L_MB","L_MB_LORO","L_MB_kraj", "L_KDPW", "L_NBP", "L_razem",
                 "W_MB","W_MB_LORO","W_MB_kraj", "W_KDPW", "W_NBP", "W_razem",
                 "S_MB","S_MB_LORO","S_MB_kraj", "S_KDPW", "S_NBP", "S_razem")
  
  row_13_17 <- c("L_MB","L_MB_LORO","L_MB_kraj", "L_KDPW", "L_NBP","L_NBP_LORO","L_NBP_kraj", "L_razem",
                 "W_MB","W_MB_LORO","W_MB_kraj", "W_KDPW", "W_NBP","W_NBP_LORO","W_NBP_kraj", "W_razem",
                 "S_MB","S_MB_LORO","S_MB_kraj", "S_KDPW", "S_NBP","S_NBP_LORO","S_NBP_kraj", "S_razem")
  
  ListOfYears <- list(read.csv("data/1999.csv",row.names = row_99_02),
                  read.csv("data/2000.csv",row.names = row_99_02),
                  read.csv("data/2001.csv",row.names = row_99_02),
                  read.csv("data/2002.csv",row.names = row_99_02),
                  read.csv("data/2003.csv",row.names = row_03_12),
                  read.csv("data/2004.csv",row.names = row_03_12),
                  read.csv("data/2005.csv",row.names = row_03_12),
                  read.csv("data/2006.csv",row.names = row_03_12),
                  read.csv("data/2007.csv",row.names = row_03_12),
                  read.csv("data/2008.csv",row.names = row_03_12),
                  read.csv("data/2009.csv",row.names = row_03_12),
                  read.csv("data/2010.csv",row.names = row_03_12),
                  read.csv("data/2011.csv",row.names = row_03_12),
                  read.csv("data/2012.csv",row.names = row_03_12),
                  read.csv("data/2013.csv",row.names = row_13_17),
                  read.csv("data/2014.csv",row.names = row_13_17),
                  read.csv("data/2015.csv",row.names = row_13_17),
                  read.csv("data/2016.csv",row.names = row_13_17),
                  read.csv("data/2017.csv",row.names = row_13_17))
  
  
  print(ListOfYears[2])
  print(as.numeric(ListOfYears[[2]][1:12][12,]))
  print(as.numeric(ListOfYears[[2]][1:12]["S_razem",]))
  print(colnames(ListOfYears[[2]]))
  
  

  
  x <- c('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December')
  y1 <- c(20, 14, 25, 16, 18, 22, 19, 15, 12, 16, 14, 17)
  y2 <- c(19, 14, 22, 14, 16, 19, 15, 14, 10, 12, 12, 16)
  data <- data.frame(x, y1, y2)
  
  #The default order will be alphabetized unless specified as below:
  data$x <- factor(data$x, levels = data[["x"]])
  
  p <- plot_ly(data, x = ~x, y = ~y1, type = 'bar', name = 'Primary Product', marker = list(color = 'rgb(49,130,189)')) %>%
    add_trace(y = ~y2, name = 'Secondary Product', marker = list(color = 'rgb(204,204,204)')) %>%
    layout(xaxis = list(title = "", tickangle = -45),
           yaxis = list(title = ""),
           margin = list(b = 100),
           barmode = 'group')
  
  # Create a shareable link to your chart
  # Set up API credentials: https://plot.ly/r/getting-started
  chart_link = api_create(p, filename="bar/rotated")
  chart_link
  
  
  
  
#    output$distPlot <- renderPlot({
#       # generate bins based on input$bins from ui.R
#       x    <- faithful[, 2] 
#       bins <- seq(min(x), max(x), length.out = input$bins + 1)
#       
#       # draw the histogram with the specified number of bins
#       hist(x, breaks = bins, col = 'darkgray', border = 'white')
#    })
# }

# Run the application 
shinyApp(ui = ui, server = server)

