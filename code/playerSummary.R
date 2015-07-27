


output$playerSummary <- renderText({
  print("enter playersummary")
  print(playerData()$bio)
  if (!is.null(playerData()$bio)) {
    summary <-  playerData()$bio 
    
  } else {
    summary <- "No Bio Available" 
    
  }
  summary
})
