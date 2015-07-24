

library(shiny)
library(shinydashboard)
library(httr)
library(rvest)
library(XML)
library(doBy) # uses MASS which has a eselect conflict with dplyr
library(dplyr) # this masks select from MASS, filter from stats and intersect etc from base
library(ggvis)
library(RSQLite)
library(lubridate)
library(stringr)
library(markdown)
library(tidyr)
library(shinyBS)
library(ggplot2)
library(leaflet)
library(rCharts)
library(shinythemes)
library(DT)
library(readr)
library(ggmap)

library(cricketr)

## prob load file and update daily??

 df <- read_csv("./data/majorsClean.csv")


# create select vectors
 players <- read_csv("./data/allPlayers.csv")
 
 playerChoice <- sort(players$player)
