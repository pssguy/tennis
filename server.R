
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
  
  
  # outlying code

  source("code/playerAtAGlance.R", local = TRUE)
  source("code/playerRankings.R", local = TRUE)
  
  
})
