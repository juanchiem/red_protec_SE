pacman::p_load(datasets, dplyr, DT, shiny, shinydashboard)

ui <- dashboardPage(
  skin = "red", 
  dashboardHeader(title = "Shiny dashboard", titleWidth = 300),
  dashboardSidebar(
    width = 300,
    sidebarMenu(
      menuItem("2. User", tabName = "user", icon = icon("user"))
    )
  ),
  dashboardBody(
      tabItem("user",
              selectInput("species", "Select a specie", iris$Species), 
              dataTableOutput("select_species") # from L22
    )
  )
)

server <- function(input, output) {
  data("iris")
  output$select_species <- renderDataTable({
    iris %>% 
      filter(Species == input$species) # from L14
  })
}

shinyApp(ui, server)
