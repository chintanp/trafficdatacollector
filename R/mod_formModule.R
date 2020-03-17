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
      div(
        id = ns("form"),
        fluidRow(
          column(4, selectInput(
            inputId = ns("location_select"),
            label = "Location",
            choices = NULL
          )),
          column(4, dateInput(ns("date3"), "Date", format = "yyyy-mm-dd"), value = Sys.Date()),
          column(
            4,
            selectInput(
              ns("time"),
              "Time",
              c("7-9am", "4-6pm"),
              selected = "7-9am",
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
              c(
                "sunny and dry",
                "cloudy, windy",
                "overcast, no rain",
                "overcast",
                "light rain",
                "raining"
              ),
              selected = "sunny and dry",
              multiple = FALSE
            )
            
          ),
          column(4, textInput(ns("name"), "Name*", "")),
          column(4, textInput(ns("notes"), "Notes", "")),
          column(
            4,
            sliderInput(
              inputId = ns("actTemp"),
              label = "Temperature (F)",
              min = -128,
              max = 136,
              value = 60,
              step = 1
            )
            # selectInput(
            #   ns("actTemp"),
            #   "Temperature (F)",
            #   c(
            #     "Below Zero",
            #     "0-20",
            #     "20-32",
            #     "32-50",
            #     "50-62",
            #     "62-75",
            #     "75-85",
            #     "85-100",
            #     "100+"
            #   ),
            #   selected = "62-75",
            #   multiple = FALSE
            # )
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
  
  initialInputs <- isolate(reactiveValuesToList(input))
  
  observe({
    # OPTIONAL - save initial values of dynamic inputs
    inputValues <- reactiveValuesToList(input)
    initialInputs <<- utils::modifyList(inputValues, initialInputs)
  })
  
  observe({
    db_conn = globals$stash$conn
    
    globals$stash$locations <-
      DBI::dbGetQuery(db_conn, "select * from Locations")
    
    updateSelectInput(session,
                      inputId = "location_select",
                      choices = globals$stash$locations$Intersection)
  })
  
  observeEvent(input$location_select, {
    # db_conn = globals$stash$conn
    #
    # globals$stash$locations <-
    #   DBI::dbGetQuery(db_conn, "select * from Locations")
    #
    # updateSelectInput(
    #   session,
    #   inputId = "location_select",
    #   choices = globals$stash$locations$Intersection
    # )
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
  
  # return this input so the elements can be used/modified in other modules
  return (list(
    input,
    resetFormElements = function() {
     
      # output$name <- renderText({
      #   ""
      # })
      # output$notes <- renderText({
      #   ""
      # })
      
      for (id in names(initialInputs)) {
        value <- initialInputs[[id]]
        # For empty checkboxGroupInputs
        if (is.null(value)) value <- ""
        session$sendInputMessage(id, list(value = value))
      }
    }
  ))
}

## To be copied in the UI
# mod_formModule_ui("formModule_ui_1")

## To be copied in the server
# callModule(mod_formModule_server, "formModule_ui_1")
