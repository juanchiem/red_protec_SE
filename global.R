#-----
# Dashboard para visualizar status de ensayos en tiempo real
# Autores: Juan Edwards Molina
#-----

# https://stackoverflow.com/questions/70265254/simple-refresh-button-in-flexdashboard-shiny-r

# Packages
pacman::p_load(
  shiny, lubridate, shinydashboard, gsheet,
  tidyverse, leaflet, DT, shinyjs,
  flextable
)

theme_set(theme_bw(base_size = 12))