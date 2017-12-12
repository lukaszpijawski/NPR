getRows_99_02 <- function()
{
  return (
    c(
      "L_MB",
      "L_KDPW",
      "L_NBP",
      "L_razem",
      "W_MB",
      "W_KDPW",
      "W_NBP",
      "W_razem",
      "S_MB",
      "S_KDPW",
      "S_NBP",
      "S_razem"
    )
  )
}

getRows_03_12 <- function()
{
  return (
    c(
      "L_MB",
      "L_MB_LORO",
      "L_MB_kraj",
      "L_KDPW",
      "L_NBP",
      "L_razem",
      "W_MB",
      "W_MB_LORO",
      "W_MB_kraj",
      "W_KDPW",
      "W_NBP",
      "W_razem",
      "S_MB",
      "S_MB_LORO",
      "S_MB_kraj",
      "S_KDPW",
      "S_NBP",
      "S_razem"
    )
  )
}

getRows_13_17 <- function()
{
  return(
    c(
      "L_MB",
      "L_MB_LORO",
      "L_MB_kraj",
      "L_KDPW",
      "L_NBP",
      "L_NBP_LORO",
      "L_NBP_kraj",
      "L_razem",
      "W_MB",
      "W_MB_LORO",
      "W_MB_kraj",
      "W_KDPW",
      "W_NBP",
      "W_NBP_LORO",
      "W_NBP_kraj",
      "W_razem",
      "S_MB",
      "S_MB_LORO",
      "S_MB_kraj",
      "S_KDPW",
      "S_NBP",
      "S_NBP_LORO",
      "S_NBP_kraj",
      "S_razem"
    )
  )
}

getYears <- function()
{
  return(
    c(
      "1999",
      "2000",
      "2001",
      "2002",
      "2003",
      "2004",
      "2005",
      "2006",
      "2007",
      "2008",
      "2009",
      "2010",
      "2011",
      "2012",
      "2013",
      "2014",
      "2015",
      "2016",
      "2017"
    )
  )
}

getLongNames <- function(input_shortnames)
{
  shortnames <- c(
    "L_MB",
    "L_MB_LORO",
    "L_MB_kraj",
    "L_KDPW",
    "L_NBP",
    "L_NBP_LORO",
    "L_NBP_kraj",
    "L_razem",
    "W_MB",
    "W_MB_LORO",
    "W_MB_kraj",
    "W_KDPW",
    "W_NBP",
    "W_NBP_LORO",
    "W_NBP_kraj",
    "W_razem",
    "S_MB",
    "S_MB_LORO",
    "S_MB_kraj",
    "S_KDPW",
    "S_NBP",
    "S_NBP_LORO",
    "S_NBP_kraj",
    "S_razem"
  )
  
  longnames <- c(
    "Liczba zleceń międzybankowych [L_MB]",
    "Liczba zleceń międzybankowych klientów LORO [L_MB_LORO]",
    "Liczba zleceń międzybankowych klientów krajowych [L_MB_kraj]",
    "Liczba zleceń z udziałem KDPW [L_KDPW]",
    "Liczba zleceń z udziałem innych klientów NBP [L_NBP]",
    "Liczba zleceń z udziałem innych klientów NBP (LORO) [L_NBP_LORO]",
    "Liczba zleceń z udziałem innych klientów NBP (krajowych) [L_NBP_kraj]",
    "Liczba zleceń razem [L_razem]",
    "Wartość zleceń międzybankowych [W_MB]",
    "Wartość zleceń międzybankowych klientów LORO [W_MB_LORO]",
    "Wartość zleceń międzybankowych klientów krajowych [W_MB_kraj]",
    "Wartość zleceń z udziałem KDPW [W_KDPW]",
    "Wartość zleceń z udziałem innych klientów NBP [W_NBP]",
    "Wartość zleceń z udziałem innych klientów NBP (LORO) [W_NBP_LORO]",
    "Wartość zleceń z udziałem innych klientów NBP (krajowych) [W_NBP_kraj]",
    "Wartość zleceń razem [W_razem]",
    "Średnia kwota zlecenia międzybankowego [S_MB]",
    "Średnia kwota zlecenia międzybankowego klientów LORO [S_MB_LORO]",
    "Średnia kwota zlecenia międzybankowego klientów krajowych [S_MB_kraj]",
    "Średnia kwota zlecenia z udziałem KDPW [S_KDPW]",
    "Średnia kwota zlecenia z udziałem innych klientów NBP [S_NBP]",
    "Średnia kwota zlecenia z udziałem innych klientów NBP (LORO) [S_NBP_LORO]",
    "Średnia kwota zlecenia z udziałem innych klientów NBP (krajowych) [S_NBP_kraj]",
    "Średnia kwota zlecenia [S_razem]"
  )
  
  output_longnames <- c()
  outside_index <- 1
  for (inside_index in 1:length(shortnames))
  {
    if (input_shortnames[[outside_index]] == shortnames[[inside_index]])
    {
      output_longnames[[outside_index]] <- longnames[[inside_index]]
      outside_index <- outside_index + 1
    }
  }
  return (output_longnames)
}

getListOfYears <- function(rows_99_02, rows_03_12, rows_13_17)
{
  return(
    list(
      read.csv("data/1999.csv", row.names = rows_99_02),
      read.csv("data/2000.csv", row.names = rows_99_02),
      read.csv("data/2001.csv", row.names = rows_99_02),
      read.csv("data/2002.csv", row.names = rows_99_02),
      read.csv("data/2003.csv", row.names = rows_03_12),
      read.csv("data/2004.csv", row.names = rows_03_12),
      read.csv("data/2005.csv", row.names = rows_03_12),
      read.csv("data/2006.csv", row.names = rows_03_12),
      read.csv("data/2007.csv", row.names = rows_03_12),
      read.csv("data/2008.csv", row.names = rows_03_12),
      read.csv("data/2009.csv", row.names = rows_03_12),
      read.csv("data/2010.csv", row.names = rows_03_12),
      read.csv("data/2011.csv", row.names = rows_03_12),
      read.csv("data/2012.csv", row.names = rows_03_12),
      read.csv("data/2013.csv", row.names = rows_13_17),
      read.csv("data/2014.csv", row.names = rows_13_17),
      read.csv("data/2015.csv", row.names = rows_13_17),
      read.csv("data/2016.csv", row.names = rows_13_17),
      read.csv("data/2017.csv", row.names = rows_13_17)
    )
  )
}


createBarPlot <-
  function(yearInNumber,
           orderTypesCheckboxes,
           ListOfYears)
  {
    year = ListOfYears[[yearInNumber - 1998]]
    cols <- head(colnames(year), -1)
    
    if (is.null(orderTypesCheckboxes))
    {
      data <- data.frame(cols)
      data$cols <- factor(data$cols, levels = data[["cols"]])
      
      return(
        plot_ly(data, x = ~cols, y = 0) %>%
          layout(
            title = yearInNumber,
            xaxis = list(title = "Miesiące", tickangle = -45),
            yaxis = list(title = ""),
            margin = list(b = 100),
            barmode = 'group'
          )
      )
    }
    
    rows <- orderTypesCheckboxes
    
    
    dataList = list()
    index = 1
    for (row in rows)
    {
      dataList[[index]] = head(as.numeric(year[row,]), -1)
      index = index + 1
    }
    
    data <- data.frame(cols, dataList)
    
    data$cols <- factor(data$cols, levels = data[["cols"]])
    
    p <- plot_ly(data, x = ~ cols) %>%
      layout(
        title = yearInNumber,
        xaxis = list(title = "Miesiące", tickangle = -45),
        yaxis = list(title = ""),
        margin = list(b = 100),
        barmode = 'group'
      )
    index <- 1
    for (row in rows)
    {
      p <-
        add_trace(
          p = p,
          y = dataList[[index]],
          name = row,
          type = 'bar'
        )
      index <- index + 1
    }
    print(p)
  }


createLinePlot <-
  function(yearInNumber,
           orderTypesCheckboxes,
           ListOfYears)
  {
    cols <- getYears()
    
    if (is.null(orderTypesCheckboxes))
    {
      data <- data.frame(cols)
      data$cols <- factor(data$cols, levels = data[["cols"]])
      
      return(
        plot_ly(
          data,
          x = ~ cols,
          y = 0,
          mode = 'lines',
          type = 'scatter'
        ) %>%
          layout(
            title = "Zestawienie wspólne",
            xaxis = list(title = "Rok", tickangle = -45),
            yaxis = list(title = ""),
            margin = list(b = 100)
          )
      )
    }
    
    rows <- orderTypesCheckboxes
    dataList = list()
    
    index = 1
    for (year in ListOfYears)
    {
      vec <- list(length(rows))
      rowIndex = 1
      for (row in rows)
      {
        vec[[rowIndex]] = tail(as.numeric(year[row,]), 1)
        rowIndex = rowIndex + 1
      }
      dataList[[index]] <- vec
      index = index + 1
    }
    data <- data.frame(cols, dataList)
    
    data$cols <- factor(data$cols, levels = data[["cols"]])
    
    p <- plot_ly(data, x = ~ cols) %>%
      layout(
        title = "Zestawienie wspólne",
        xaxis = list(title = "Rok", tickangle = -45),
        yaxis = list(title = ""),
        margin = list(b = 100)
      )
    
    index <- 1
    for (row in rows)
    {
      listForPlot = list(length(ListOfYears))
      yearIndex = 1
      for (year in ListOfYears)
      {
        
        listForPlot[[yearIndex]] = dataList[[yearIndex]][[index]]
        yearIndex = yearIndex + 1
      }
      p <-
        add_trace(
          p = p,
          y = listForPlot,
          name = row,
          mode = 'lines+markers',
          type = 'scatter'
        )
      listForPlot = list()
      index <- index + 1
    }
      
    print(p)
  }
