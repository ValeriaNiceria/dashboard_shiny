
ui_inicio <- function(id) {
  
  ns <- NS(id)
  
  tabItem(
    tabName = "tab_inicio",   
    class="active",
    style="min-height: 1000px;",
    fluidRow(
      column(
        width = 12,
        h3(class="text-center", "Atualizar - Primeira página!")
      )
    )
  )
  
}