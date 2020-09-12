
ui_esquisse <- function(id) {
  
  ns <- NS(id)
  
  tabItem(
    tabName = "tab_esquisse",
    fluidRow(
      column(
        width = 4,
        style="margin-top: -10px;",
        radioGroupButtons(
          ns("input_dados"), 
          label = "Selecione a base de dados:", 
          choices = c(
            "Iris" = "iris", 
            "MTCars" = "mtcars"), 
          selected = "iris",
          status = "primary"
        )
      )
    ),
    fluidRow(
      column(
        width=12,
        style = "min-height: 300px; max-height = 400px; height = 400px",
        esquisserUI(
          id = ns("plot_esquisse"),
          header = FALSE,
          choose_data = FALSE
        )
      )
    )
  )
  
}