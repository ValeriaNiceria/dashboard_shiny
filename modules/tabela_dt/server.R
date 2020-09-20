server_tabela_dt <- function(input, output, session) {
  
  
  output$tabela_simples <- renderDataTable({
    iris <- iris %>% 
      mutate(
        imagem = case_when(
          Species == "setosa" ~ paste0('<img src="https://www.floresefolhagens.com.br/wp-content/uploads/2019/01/flor-de-iris-1-8.jpg" height="50px">'),
          Species == "versicolor" ~ paste0('<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Lilla_iris_randers.jpg/250px-Lilla_iris_randers.jpg" height="50px">'),
          Species == "virginica" ~ paste0('<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR8RewKLsjXsvs8FWHbgTJq2nv7dQ66ASURgQ&usqp=CAU" height="50px">')
        )
      )
    
    datatable(iris, 
              rownames = FALSE, 
              escape = FALSE,
              extensions = c("Buttons"),
              options = list(
                dom = 'Bt',
                buttons = list(list(extend = "print", 
                                    exportOptions = list(stripHtml = FALSE, columns = ':visible'),
                                    orientation = 'landscape',
                                    customize = JS("function(doc){console.dir(doc);}"))),
                pageLength = nrow(iris),
                scroller = TRUE,
                scrollX = TRUE,
                scrollY = 500
              )
    )
    
    
  })
  
}
