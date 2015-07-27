

# Data for front page

output$winLossBox <- renderInfoBox({
  if(is.null(data())) return()
  print("enter winloss")
  infoBox(
    "Record",data()$showRecord,subtitle ='W - L', icon = icon("futbol-o"),color = "light-blue"
  )
  
  ## image birth bio
  

  
})