server <- function(input, output, session) {
  observeEvent(input$Actualizar, {
    refresh()
  })
  
  url_meta <- "https://docs.google.com/spreadsheets/d/165Mu7j6k2QVZN4NPJvy42-WCj8WyH4C-flKlEF-NB4Y/edit#gid=663634411"
 
  meta <- reactive({
    gsheet2tbl(url_meta)
  })
  
  output$progressBox <- renderInfoBox({
    infoBox(
      "DDS", input$count, icon = icon("thumbs-up", lib = "glyphicon"),
      color = "purple"
    )
  })
  
  url_terapicos <- "https://docs.google.com/spreadsheets/d/165Mu7j6k2QVZN4NPJvy42-WCj8WyH4C-flKlEF-NB4Y/edit#gid=0"
  
  data <- reactive({
    gsheet2tbl(url_terapicos)
    })
  
  output$table <- renderDataTable({
    datatable(data() %>% group_by(ensayo) %>% summarise(canopeo = mean(canopeo)),
              editable = TRUE,
              options = list(
                columnDefs = list(list(className = "dt-center", targets = "_all"))
              )
    )
  })
  
  output$plot_canopeo <- renderPlot({
    
    data() %>%     
      ggplot() +
      aes(x = fecha, y = canopeo) +
      geom_jitter(alpha=0.5, width = 0.1)+
      geom_boxplot(alpha=.5, width=.1) + 
      facet_wrap(~ ensayo) 
    
  })
  
}