
shinyServer(function(input, output, session) {

  ## input options
  
  output$a <- renderUI({
    if (input$sbMenu=="pl_glance") {
    inputPanel(
      selectizeInput(
        "player","Select or Type Player's Name",playerChoice,  options = list(maxOptions =
                                                                                10000)
      ),
      actionButton("getPlayer","Go")
    )
    } else if (input$sbMenu=="pl_rankings"){
      inputPanel(
        selectizeInput(
          "ranker","Select or Type Player's Name",rankingChoice,  options = list(maxOptions =
                                                                                  10000)
        ),
        actionButton("getRanker","Go")
      )
    }
  })
  
  
  data <- eventReactive(input$getPlayer,{
    input$getPlayer
    print("enter data")
    player <- input$player
    
    ## record + would be nice to have something from rankings
    wins <- df %>% 
      filter(winner==player) %>%   ## has some funny looking data
      nrow() #140
    losses <- df %>% 
      filter(loser==player) %>%    ## has some funny looking data
      nrow()  #29
    
    showRecord <-  paste0(wins," - ",losses)
    
    ## 
    
    info=list(showRecord=showRecord,player=player)
    return(info)
    
  })
  
  
  playerData <- eventReactive(data(),{
    #input$getPlayer
    print("enter playerData")
    
    thePlayer <- data()$player
    print(thePlayer)
    
    urlID <- players[players$player==thePlayer,]$urlID
    
    url <- paste0("http://www.atpworldtour.com/",urlID)
    url <- str_replace(url,"overview","bio")
    print(url)
    
    
    
    #s <-html("http://www.atpworldtour.com/en/players/ilie-nastase/n008/bio")
    
    s <-html(url)
    
    birthPlace <-s %>%  html_node("td:nth-child(1) .table-value") %>% html_text(trim=T) #"Bucharest, Romania"
    birthDate <- s %>%  html_node(".table-birthday")   %>% html_text(trim=T) %>% 
      str_replace("[(]","") %>%  str_replace("[)]","") # could do more - for ,
    library(rdom)
    t <- rdom(url) # Error in rdom(url) : phantomjs couldn't open the page.
    bio <- s %>% html_nodes(".article-copy centred-content p") %>% html_text(trim=T)
    
    bio <- s %>% html_nodes("#playerBioContainer p") %>% html_text(trim=T)
    
    print("bio")  # both provide nthing
    print(bio)
    
    info = list(birthPlace=birthPlace,birthDate=birthDate,bio=bio)
    return(info)
  })
  
  s %>% html_nodes("p") ## just gives the copyright
  
  
  # outlying code

  source("code/playerAtAGlance.R", local = TRUE)
  source("code/playerRankings.R", local = TRUE)
  source("code/playerBirth.R", local = TRUE)
  source("code/playerSummary.R", local = TRUE)
  
  
  
})
