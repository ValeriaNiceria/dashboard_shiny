

server_esquisse <- function(input, output, session, tabs) {
  
  
  dados_plot <- reactiveValues(data = NULL, name = NULL)
  
  observe({
    if (input$input_dados == "iris") {
      dados_plot$data <- iris
      dados_plot$name <- "iris"
    } else {
      dados_plot$data <- mtcars
      dados_plot$name <- "mtcars"
    }
  })
  
  observeEvent(tabs, {
    if (tabs == "tab_esquisse") {
      callModule(
        module = esquisserServer, 
        id = "plot_esquisse", 
        data = dados_plot
      )
    }
  })
  
  
}