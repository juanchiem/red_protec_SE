ui <- dashboardPage(
  
  dashboardHeader(title = "Red protección SE"),
  
  dashboardSidebar(useShinyjs(),
                   actionButton("Actualizar", inputId = "Actualizar"), 
                   sidebarMenu(
                     menuItem("Inicio", tabName = "home", icon = icon("home")),
                     menuItem("Terapicos", tabName = "terapicos", icon = icon("seedling")),
                     menuItem("Foliares", tabName = "foliares", icon = icon("leaf"))
                   )),
  dashboardBody(
    
    tabItems(
      
      # First tab content
      tabItem(tabName = "home",
              h2("Red de protección sanitaria de trigo y cebada")
      ), 
      
      # Second tab content
      tabItem(tabName = "terapicos",
              
              # Boxes need to be put in a row (or column)
              
              fluidRow(
                # box(infoBoxOutput("progressBox")),
                # box(DTOutput("table")),
                box(
                  title = "Canopeo", 
                  solidHeader = TRUE,
                  plotOutput("plot_canopeo"))
              )
      ), 
      # Third tab content
      tabItem(tabName = "foliares",
              h2("Foliares tab content")
      )
    )
  )
)
