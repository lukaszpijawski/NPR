getRows_99_02 <- function()
{
  return(c(
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
  ))
}

getRows_03_12 <- function()
{
  return (c(
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
  ))
}

getRows_13_17 <- function()
{
  return(c(
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
  ))
}

getListOfYears <- function(rows_99_02, rows_03_12, rows_13_17)
{
  return(list(
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
  ))
}



createPlot <- function(yearInNumber, orderTypesCheckboxes, ListOfYears)
{
  year = ListOfYears[[yearInNumber - 1998]]
  
  cols <- colnames(year)
  rows <- orderTypesCheckboxes$choiceNames#rownames(year)
  print(orderTypesCheckboxes)
  
  dataList = list()
  index = 1
  for (row in rows)
  {
    dataList[[index]] = as.numeric(year[row, ])
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
    if (row == "L_razem")
    {
      p <-
        add_trace(
          p = p,
          y = dataList[[index]],
          name = row,
          type = 'bar'
        )
    }
    else
    {
      p <-
        add_trace(
          p = p,
          y = dataList[[index]],
          name = row,
          type = 'bar',
          visible = "legendonly"
        )
    }
    index <- index + 1
  }
  print(p)
}
