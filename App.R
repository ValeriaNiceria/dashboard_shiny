
source("./global.R", encoding = "UTF-8")


header <- uiOutput("ui_header")
sidebar <- uiOutput("ui_sidebar")
body <- uiOutput("ui_body")


ui <- dashboardPagePlus(
  title = "Dashboard Shiny",
  header,
  sidebar,
  body
)


server <- function(input, output, session) {
  
  # Header UI
  output$ui_header <- renderUI({
    shinydashboardPlus::dashboardHeaderPlus(
      title = tagList(
        img(
          class= "logo-lg", 
          src="img/banner.png", 
          width = "100%", 
          style="padding: 10px; margin: 0px auto;"
        ),
        img(
          class="logo-mini", 
          style="width: 42px; margin-left: -10px; margin-top: 5px;", 
          src = "img/favicon.png"
        )
      )
      # tags$li(
      #   class = "dropdown",
      #   
      # )
    )
  })
  
  
  # Sidebar UI
  output$ui_sidebar <- renderUI({
    shinydashboard::dashboardSidebar(
      sidebarMenu(
        id = "tabs",
        # Menu Lateral 
        menuItem("Início", tabName = "tab_inicio", icon = icon("home")),
        menuItem("Esquisse", tabName = "tab_esquisse", icon = icon("home"))
      )
    )
  })
  
  # Body UI
  output$ui_body <- renderUI({
    shinydashboard::dashboardBody(
      tags$head(
        tags$link(rel = "shortcut icon", href = "img/favicon.png"),
        tags$link(rel = "stylesheet", type = "text/css", href = "css/style.css"),
        tags$script(
          HTML('$(document).ready(function() {
          $("body").addClass("sidebar-collapse");
          $(".sidebar-menu > li").first().addClass("active");
               })')
        ),
        tags$style('.skin-blue .main-header .logo:hover {
                   background: #033653;
                   }')
      ),
      useShinyjs(),
      # Inicio - Conteúdo
      tabItems(
        ui_inicio(
          id = "tab_inicio"
        ),
        tabItem(
          tabName = "tab_esquisse",  
          style="min-height: 1000px;",
          fluidRow(
            column(
              width = 4,
              radioButtons(
                inputId = "data", 
                label = "Data to use:", 
                choices = c("iris", "mtcars"),
                inline = TRUE
              ),
            )
          ),
          fluidRow(
            column(
              width = 12,
              esquisserUI(
                id = "esquisse", 
                header = FALSE, # dont display gadget title
                choose_data = FALSE, # dont display button to change data,
                container = esquisseContainer(height = "500px")
              )
            )
          )
        )
        
      )
      
    )
  })
  
  
  
  ## Observe's -----------------------------------------------------------------
  
  
  
  
  
  
  
  ## Reactive's ----------------------------------------------------------------
  
  
  
  
  
  
  
  ## Output's  -----------------------------------------------------------------
  
  
  callModule(
    module = server_inicio,
    id = "tab_inicio"
  )
  
  
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
             id = "esquisse",
             data = data_r)
  
  
}


shinyApp(ui = ui, server = server)