

# Data for front page
data <- eventReactive(input$getPlayer,{
  input$getPlayer
  
  player <- input$player
  
  wins <- df %>% 
    filter(winner==player) %>%   ## has some funny looking data
  nrow() #140
  losses <- df %>% 
    filter(loser==player) %>%    ## has some funny looking data
  nrow()  #29
  
  showRecord <-  paste0(wins," - ",losses)
  
  info=list(showRecord=showRecord)
  return(info)
  
})

output$winLossBox <- renderInfoBox({
  infoBox(
    "Record",data()$showRecord,subtitle ='W - L', icon = icon("futbol-o"),color = "light-blue"
  )
  
})