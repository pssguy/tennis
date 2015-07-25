

rankingData <- eventReactive(input$getPlayer,{
  input$getPlayer
  
 # player <- input$player
  
  fed <- df.ranking %>% 
    filter(Player==input$player) %>% 
    select(date,Ranking) 
  
  rownames(fed) <- fed[[1]]
  
  rank.xts <- as.xts(fed)
  str(rank.xts) # An ‘xts’ object on 1997-09-22/2015-07-20 containing: 899 datapoints
  
  max <- extract_numeric(max(rank.xts$Ranking))
  min <- extract_numeric(min(rank.xts$Ranking))
  
  info=list(max=max,min=min,rank.xts=rank.xts)
  return(info)
})
  

output$rankings <- renderDygraph({
  
  if(is.null(rankingData())) return()
  
  
  
  title <- paste0(input$player," - Singles Ranking") 
  
  dygraph(rankingData()$rank.xts, main=title,ylab="Rank") %>% 
    dyAxis("y", valueRange = c(rankingData()$max,rankingData()$min)) %>% 
    dyLegend(show="onmouseover") %>% 
    dyRangeSelector()
})

