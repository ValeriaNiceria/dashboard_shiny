
server_esquisse <- function(input, output, session) {
  
  ns <- session$ns
  
  data_r <- reactiveValues(data = iris, name = "iris")
  
  observeEvent(input$data, {
    print(paste(input$data))
    if (length(input$data) == 0 | input$data == "iris") {
      data_r$data <- iris
      data_r$name <- "iris"
    } else {
      data_r$data <- mtcars
      data_r$name <- "mtcars"
    }
  })
  
  callModule(module = esquisserServer, 
             id = ns("esquisse"),
             data = data_r)
  
}