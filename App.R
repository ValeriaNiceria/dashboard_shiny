
source("./global.R", encoding = "UTF-8")


ui <- dashboardPagePlus(
  title = "Dashboard Shiny",
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
                menuItem("Esquisse", tabName = "tab_esquisse", icon = icon("line-chart"))
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
      ui_esquisse(
        id = "tab_esquisse"
      )
    )
  )
)

server <- function(input, output) {
  
  
  callModule(
    module = server_esquisse, 
    id = "tab_esquisse",
    tabs = input$tabs
  )

  
}

shinyApp(ui, server)