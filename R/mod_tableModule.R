#' tableModule UI Function
#'
#' @description This module generates the table of summary of
#' collected traffic data so far.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_tableModule_ui <- function(id) {
  ns <- NS(id)
  tagList(shiny::fluidRow(column(
    12,
    bs4Dash::bs4Card(
      title = "Helmet Counter",
      closable = FALSE,
      status = "warning",
      collapsible = TRUE,
      elevation = 4,
      width = NULL,
      maximizable = TRUE,
      fluidRow(
        bs4Dash::bs4Table(
          cardWrap = TRUE,
          bordered = TRUE,
          striped = TRUE,
          style = "padding: 0px; text-align:center;",
          headTitles = c("Helmet",
                         "Male",
                         "Female",
                         "Total"),
          bs4Dash::bs4TableItems(
            bs4Dash::bs4TableItem("with helmet", style = "padding: 10px; text-align:center;"),
            bs4Dash::bs4TableItem(dataCell = TRUE, shinyWidgets::actionBttn(ns(
              "helmet_male_btn"), 0,
              color = "royal",
              style = "jelly",
              icon = icon("plus"),
              block = FALSE, 
              size = "sm"
            ), style = "padding: 10px; text-align:center;"),
            bs4Dash::bs4TableItem(dataCell = TRUE, shinyWidgets::actionBttn(ns(
              "helmet_female_btn"), 0,
              color = "royal",
              style = "jelly",
              icon = icon("plus"),
              block = FALSE, 
              size = "sm"
            ), style = "padding: 10px; text-align:center;"),
            bs4Dash::bs4TableItem(dataCell = TRUE, textOutput(ns("helmet_total")), style = "padding: 10px; text-align:center;")
          ),
          bs4Dash::bs4TableItems(
            bs4Dash::bs4TableItem("without helmet", style = "padding: 10px; text-align:center;"),
            bs4Dash::bs4TableItem(dataCell = TRUE, shinyWidgets::actionBttn(ns(
              "wo_helmet_male_btn"), 0,
              color = "royal",
              style = "jelly",
              icon = icon("plus"),
              block = FALSE, 
              size = "sm"
            ), style = "padding: 10px; text-align:center;"),
            bs4Dash::bs4TableItem(dataCell = TRUE, shinyWidgets::actionBttn(ns(
              "wo_helmet_female_btn"), 0,
              color = "royal",
              style = "jelly",
              icon = icon("plus"),
              block = FALSE, 
              size = "sm"
            ), style = "padding: 10px; text-align:center;"),
            bs4Dash::bs4TableItem(dataCell = TRUE, textOutput(ns("wo_helmet_total")), style = "padding: 10px; text-align:center;")
          ),
          bs4Dash::bs4TableItems(
            bs4Dash::bs4TableItem("Total", style = "padding: 10px; text-align:center;"),
            bs4Dash::bs4TableItem(dataCell = TRUE, textOutput(ns("male_total")), style = "padding: 10px; text-align:center;"),
            bs4Dash::bs4TableItem(dataCell = TRUE, textOutput(ns("female_total")), style = "padding: 10px; text-align:center;"),
            bs4Dash::bs4TableItem(dataCell = TRUE, textOutput(ns("grand_total")), style = "padding: 10px; text-align:center;")
          )
          
        )
      )
    )
  )))
}

#' tableModule Server Function
#'
#' @noRd
mod_tableModule_server <- function(input, output, session, globals) {
  ns <- session$ns
  
  # Wait for a button click 
  observeEvent(input$helmet_male_btn, {
    # print(globals$stash)
    globals$stash$male_helmet_count <- globals$stash$male_helmet_count + 1
    updateActionButton(session, "helmet_male_btn",
                       label = as.character(globals$stash$male_helmet_count))
    # Update the Helmet total
    output$helmet_total <- renderText({
      as.character(globals$stash$male_helmet_count + globals$stash$female_helmet_count)
    })
    # Update the male total
    output$male_total <- renderText({
      as.character(globals$stash$male_helmet_count + globals$stash$male_no_helmet_count)
    })
    #Update the grand total
    output$grand_total <- renderText({
      as.character(globals$stash$male_helmet_count + globals$stash$female_helmet_count + 
                     globals$stash$male_no_helmet_count + globals$stash$female_no_helmet_count)
    })
  })
  
  # Wait for a button click 
  observeEvent(input$helmet_female_btn, {
    # print(globals$stash)
    globals$stash$female_helmet_count <- globals$stash$female_helmet_count + 1
    updateActionButton(session, "helmet_female_btn",
                       label = as.character(globals$stash$female_helmet_count))
    
    # Update the Helmet total
    output$helmet_total <- renderText({
      as.character(globals$stash$male_helmet_count + globals$stash$female_helmet_count)
    })
    # Update the female total
    output$female_total <- renderText({
      as.character(globals$stash$female_helmet_count + globals$stash$female_no_helmet_count)
    })
    #Update the grand total
    output$grand_total <- renderText({
      as.character(globals$stash$male_helmet_count + globals$stash$female_helmet_count + 
                     globals$stash$male_no_helmet_count + globals$stash$female_no_helmet_count)
    })
  })
  
  # Wait for a button click 
  observeEvent(input$wo_helmet_male_btn, {
    # print(globals$stash)
    globals$stash$male_no_helmet_count <- globals$stash$male_no_helmet_count + 1
    updateActionButton(session, "wo_helmet_male_btn",
                       label = as.character(globals$stash$male_no_helmet_count))
    
    # Update the No Helmet total
    output$wo_helmet_total <- renderText({
      as.character(globals$stash$male_no_helmet_count + globals$stash$female_no_helmet_count)
    })
    # Update the male total
    output$male_total <- renderText({
      as.character(globals$stash$male_helmet_count + globals$stash$male_no_helmet_count)
    })
    #Update the grand total
    output$grand_total <- renderText({
      as.character(globals$stash$male_helmet_count + globals$stash$female_helmet_count + 
                     globals$stash$male_no_helmet_count + globals$stash$female_no_helmet_count)
    })
  })
  
  # Wait for a button click 
  observeEvent(input$wo_helmet_female_btn, {
    # print(globals$stash)
    globals$stash$female_no_helmet_count <- globals$stash$female_no_helmet_count + 1
    updateActionButton(session, "wo_helmet_female_btn",
                       label = as.character(globals$stash$female_no_helmet_count))
    # Update the No Helmet total
    output$wo_helmet_total <- renderText({
      as.character(globals$stash$male_no_helmet_count + globals$stash$female_no_helmet_count)
    })
    # Update the female total
    output$female_total <- renderText({
      as.character(globals$stash$female_helmet_count + globals$stash$female_no_helmet_count)
    })
    #Update the grand total
    output$grand_total <- renderText({
      as.character(globals$stash$male_helmet_count + globals$stash$female_helmet_count + 
                     globals$stash$male_no_helmet_count + globals$stash$female_no_helmet_count)
    })
  })
}

## To be copied in the UI
# mod_tableModule_ui("tableModule_ui_1")

## To be copied in the server
# callModule(mod_tableModule_server, "tableModule_ui_1")
