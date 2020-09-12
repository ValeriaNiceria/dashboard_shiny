
source("./global.R", encoding = "UTF-8")


header <- uiOutput("ui_header")
body <- uiOutput("ui_body")


ui <- dashboardPagePlus(
  title = "Dashboard Shiny",
  header,
  sidebar = shinydashboard::dashboardSidebar(
    sidebarMenu(
      id = "tabs",
      # Menu Lateral 
      menuItem("Início", tabName = "tab_inicio", icon = icon("home")),
      menuItem("Esquisse", tabName = "tab_esquisse", icon = icon("chart-line"))
    )
  ),
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
        tabItems(
          ui_inicio(
            id = "tab_inicio"
          ),
          ui_esquisse(
            id = "tab_esquisse"
          )
        )
      )
    
  })
  
  
  
  
  # Output's ----------------------------------------------------------------
  
  callModule(
    module = server_inicio, 
    id = "tab_inicio"
  )
  
  
  observeEvent(input$tabs, {
    
    tab_menu_selected <- input$tabs
    
    callModule(
      module = server_esquisse, 
      id = "tab_esquisse",
      tabs = tab_menu_selected
    )
    
  })
  
  
 

  
}

shinyApp(ui, server)