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
         plotlyOutput("distPlot")
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
  
  #print(ListOfYears[[10]]$Luty)
  #print(ListOfYears[[5]][1,])
  #print(ListOfYears[[5]][2,])
  
  
   output$distPlot <- renderPlotly({
      # generate bins based on input$bins from ui.R
     
      year =  ListOfYears[[19]]
     
      cols <- colnames(year)
      rows <- rownames(year)
      row1 <- as.numeric(year[1,])
      row2 <- as.numeric(year[2,])
      row3 <- as.numeric(year[3,])
      row4 <- as.numeric(year[4,])
      
      l <- c(row1, row2, row3, row4)
      
      data <- data.frame(cols, row1, row2, row3, row4)
      data$cols <- factor(data$cols, levels = data[["cols"]])
      
      plot_ly(data, x = ~cols, y = row1, name = rows[1], type = 'bar') %>%
        add_trace(y = ~row2, name = rows[2]) %>%
        add_trace(y = ~row3, name = rows[3]) %>%
        add_trace(y = ~row4, name = rows[4]) %>%
        layout(xaxis = list(title = "", tickangle = -45),
               yaxis = list(title = ""),
               margin = list(b = 100),
               barmode = 'group')
          
      # draw the histogram with the specified number of bins
      #hist(x, bins, col = 'darkgray', border = 'white')
      #barplot(bins, main = "Wartości", xlab = "Miesiące", col=c("darkblue","red"), legend.text = rows, beside=TRUE)

   })
}

# Run the application 
shinyApp(ui = ui, server = server)

