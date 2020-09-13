
server_tabela_dt <- function(input, output, session) {
  
  
  output$tabela_simples <- renderDataTable({
    datatable(iris)
  })
  
}