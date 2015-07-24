



dashboardPage(
  skin = "yellow",
  dashboardHeader(title = "Tennis Majors Mens Singles", titleWidth = 300),
  
  dashboardSidebar(
   # includeCSS("custom.css"),
    selectInput("player","Type in or Select Player", playerChoice),
    
    
    
    sidebarMenu(
      id = "sbMenu",
      
      
      
      
      menuItem(
        "Players", tabName = "players",icon = icon("table"),
        menuSubItem("At A Glance", tabName = "pl_glance", selected = T),
        menuSubItem("By Tournament", tabName = "pl_tourney")
        
        
        
      ),
      
#       menuItem("Info", tabName = "info",icon = icon("info")),
#       menuItem("Code",icon = icon("code-fork"),
#                    href = "https://github.com/pssguy/cricket"),
      
      menuItem(
        "Other Dashboards",
        menuSubItem("Climate",href = "https://mytinyshinys.shinyapps.io/climate"),
        menuSubItem("Mainly Maps",href = "https://mytinyshinys.shinyapps.io/mainlyMaps"),
        menuSubItem("MLB",href = "https://mytinyshinys.shinyapps.io/mlbCharts"),
        
        menuSubItem("WikiGuardian",href = "https://mytinyshinys.shinyapps.io/wikiGuardian"),
        menuSubItem("World Soccer",href = "https://mytinyshinys.shinyapps.io/worldSoccer")
        
      ),
      
      menuItem("", icon = icon("twitter-square"),
               href = "https://twitter.com/pssGuy"),
      menuItem("", icon = icon("envelope"),
               href = "mailto:agcur@rogers.com")
      
      
    )
  ),


  dashboardBody(tabItems(
    ### Players section
    
    tabItem(
      "pl_glance",
      

      fluidRow(
        column(width = 3,
               infoBoxOutput("winLossBox", width = 12)),
        column(width = 3,
               infoBoxOutput("Ranking", width = 12))
#         column(width = 3,
#                infoBoxOutput("runsBox", width = 12)),
#         
#         column(width = 3,
#                infoBoxOutput("wicketsBox", width = 12))
      )
      
      
      
  ),
    
    
    

    
    
    tabItem("pl_tourney"
    
            ), 
            
    
            
            
            tabItem("info",includeMarkdown("info.md"))
            
            
            
            
            
            
            
    ) # tabItems
    ) # body
  ) # page
  