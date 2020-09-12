
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

# Carregando as funções --------------------------------------------------------


# Carregando os módulos --------------------------------------------------------
source("./functions/funcoes.R", encoding = "UTF-8")

source("./modules/inicio/ui.R", encoding = "UTF-8")
source("./modules/inicio/server.R", encoding = "UTF-8")

# source("./modules/esquisse/ui.R", encoding = "UTF-8")
# source("./modules/esquisse/server.R", encoding = "UTF-8")



# Carregando os dados ----------------------------------------------------------



