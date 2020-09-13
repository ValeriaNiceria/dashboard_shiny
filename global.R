
rm(list=ls())

# Carregando os pacotes --------------------------------------------------------
library(shiny)
library(tidyverse)
library(shinydashboard)
library(shinydashboardPlus)
library(shinyjs)
library(htmlwidgets)
library(shinycssloaders)
library(shinyWidgets)
library(shinyalert)
library(shinyBS)
library(esquisse)
library(DT)

# Carregando as funções --------------------------------------------------------
source("./functions/function.R", encoding = "UTF-8")


# Carregando os módulos --------------------------------------------------------
source("./modules/tabela_dt/ui.R", encoding = "UTF-8")
source("./modules/tabela_dt/server.R", encoding = "UTF-8")

source("./modules/esquisse/ui.R", encoding = "UTF-8")
source("./modules/esquisse/server.R", encoding = "UTF-8")




# Carregando os dados ----------------------------------------------------------



