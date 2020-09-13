
ui_tabela_dt <- function(id) {
  
  ns <- NS(id)
  
  tabItem(
    tabName = "tab_tabela_dt",  
    style="min-height: 1000px;",
    fluidRow(
      column(
        width = 12,
        h3(class="text-center", "Olá!")
      )
    )
  )
  
}