
ui_esquisse <- function(id) {
  
  ns <- NS(id)
  
  tabItem(
    tabName = "tab_esquisse",
    fluidPage(
      
      titlePanel("Use esquisse as a Shiny module"),
      
      sidebarLayout(
        sidebarPanel(
          radioButtons(
            inputId = ns("data"), 
            label = "Data to use:", 
            choices = c("iris", "mtcars"),
            inline = TRUE
          )
        ),
        mainPanel(
          tabsetPanel(
            tabPanel(
              title = "esquisse",
              esquisserUI(
                id = ns("esquisse"), 
                header = FALSE, # dont display gadget title
                choose_data = FALSE # dont display button to change data
              )
            ),
            tabPanel(
              title = "output",
              verbatimTextOutput(ns("module_out"))
            )
          )
        )
      )
    )
  )
  
  
  
}