
server_esquisse <- function(input, output, session) {
  
  data_r <- reactiveValues(data = iris, name = "iris")
  
  observeEvent(input$data, {
    if (input$data == "iris") {
      data_r$data <- iris
      data_r$name <- "iris"
    } else {
      data_r$data <- mtcars
      data_r$name <- "mtcars"
    }
  })
  
  result <- callModule(
    module = esquisserServer,
    id = "esquisse",
    data = data_r
  )
  
  output$module_out <- renderPrint({
    str(reactiveValuesToList(result))
  })
  
}