
source("./global.R", encoding = "UTF-8")


ui <- dashboardPagePlus(
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
  ),
  shinydashboard::dashboardSidebar(
    sidebarMenu(id = "tabs",
                # menuItem("inicio", tabName = "inicio", icon = icon("home")),
                menuItem("Esquisse", tabName = "esquisse", icon = icon("line-chart"))
    )
  ),
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
    tabItems(
      tabItem(
        tabName = "esquisse",
        fluidRow(
          column(
            width = 4,
            style="margin-top: -10px;",
            radioGroupButtons(
              "input_dados", 
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
              id = "plot_esquisse",
              header = FALSE,
              choose_data = FALSE
            )
          )
        )
      )
    )
  )
)

server <- function(input, output) {
  
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
  
  observeEvent(input$tabs, {
    if (input$tabs == "esquisse") {
      callModule(
        module = esquisserServer, 
        id = "plot_esquisse", 
        data = dados_plot
      )
    }
  })

  
}

shinyApp(ui, server)