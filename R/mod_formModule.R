#' formModule UI Function
#'
#' @description This module generates the form for inputting address, time-slot etc.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_formModule_ui <- function(id) {
  ns <- NS(id)
  tagList(fluidRow(column(
    12,
    bs4Dash::bs4Card(
      title = "Context Input Form",
      closable = FALSE,
      status = "purple",
      collapsible = TRUE,
      elevation = 4,
      width = NULL,
      solidHeader = TRUE,
      div(
        id = "form",
        fluidRow(
          column(4, selectInput(
            inputId = ns("location_select"),
            label = "Location",
            choices = NULL
          )),
          column(4, dateInput(ns("date3"), "Date", format = "mm/dd/yyyy")),
          column(
            4,
            selectInput(
              ns("time"),
              "Time",
              c("7-9 AM", "4-6 PM"),
              selected = "7-9 AM",
              multiple = FALSE
            )
          )
        ),
        fluidRow(
          column(
            4,
            selectInput(
              ns("weather"),
              "Weather",
              c("Sunny", "Partly Cloudy", "Cloudy", "Raining", "Snowing"),
              selected = "Sunny",
              multiple = FALSE
            )
            
          ),
          column(4, textInput(ns("name"), "Name", "")),
          column(4, textInput(ns("notes"), "Notes", "")),
          column(
            4,
            selectInput(
              ns("actTemp"),
              "Temperature (F)",
              c(
                "Below Zero",
                "0-20",
                "20-32",
                "32-50",
                "50-62",
                "62-75",
                "75-85",
                "85-100",
                "100+"
              ),
              selected = "62-75",
              multiple = FALSE
            )
          )
        )
      )
    )
  )))
  
}

#' formModule Server Function
#'
#' @noRd
mod_formModule_server <- function(input, output, session, globals) {
  ns <- session$ns
  
  observeEvent(input$location_select, {
    
    db_conn = globals$stash$conn
    
    globals$stash$locations <- 
      DBI::dbGetQuery(db_conn, "select * from Locations")
    
    updateSelectInput(
      session,
      inputId = "location_select",
      choices = globals$stash$locations$Intersection
    )
  })
  
  observe({
    globals$stash$name = input$name
    globals$stash$location = input$location_select
    globals$stash$time = input$time
    globals$stash$date = input$date3
    globals$stash$notes = input$notes
    globals$stash$weather = input$weather
    globals$stash$temperature = input$actTemp
  })
  
}

## To be copied in the UI
# mod_formModule_ui("formModule_ui_1")

## To be copied in the server
# callModule(mod_formModule_server, "formModule_ui_1")
