


output$birthDate <- renderText({
  if (is.null(playerData()))  return()
  print("enter birthdate")
   
 # if (is.null(input$player))
 #   return()
  
  playerData()$birthDate
})


output$birthPlace <- renderLeaflet({
  print("enter birthplace")
  print(playerData())
  if(is.null(playerData())) return()
  print("enter birthplace not NULL")
    
  
  loc <- playerData()$birthPlace
  
  df <- geocode(loc)
  
  theLat <- df$lat
  theLon <- df$lon
  
  
  df    %>%
    leaflet() %>%
    addTiles() %>%
    setView(theLon,theLat, zoom = 9) %>%
    addMarkers()
})