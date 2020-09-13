
ui_tabela_dt <- function(id) {
  
  ns <- NS(id)
  
  tabItem(
    tabName = "tab_tabela_dt",  
    class="active",
    style="min-height: 1000px;",
    fluidRow(
      box(
        width = 12,
        title = "Tabela simples",
        withSpinner(dataTableOutput(ns("tabela_simples")))
      )
    )
  )
  
}