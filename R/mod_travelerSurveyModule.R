#' travelerSurveyModule UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_travelerSurveyModule_ui <- function(id) {
  ns <- NS(id)
  tagList(tagList(fluidRow(column(
    12,
    bs4Dash::bs4Card(
      title = "Traveler Survey",
      closable = FALSE,
      status = "purple",
      collapsible = TRUE,
      elevation = 4,
      width = NULL,
      solidHeader = TRUE,
      div(
        id = "form",
        fluidRow(
          column(6, dateInput(ns("date_survey"), "Date*", format = "mm/dd/yyyy")),
          column(4, shinyTime::timeInput(
            ns("time_input1"), "Time*", value = strptime("12:34:56", "%T")
          )),
          column(
            2,
            shinyWidgets::actionBttn(
              ns("to_current_time"),
              "Current time",
              color = "royal",
              size = "md",
              style = "material-flat"
            ),
            style = "display:flex;justify-content:center;align-items:flex-end; padding: 0 0 20px 0"
          )
        ),
        fluidRow(column(6, textInput(
          ns("name_survey"), "Volunteer Name*", ""
        )),
        column(6, textInput(
          ns("location_survey"), "Location*", ""
        ))),
        fluidRow(column(6, textInput(
          ns("trip_origin"), "Trip Origin*", ""
        )),
        column(
          6, textInput(ns("trip_destination"), "Trip Destination*", "")
        )),
        fluidRow(column(6, textInput(
          ns("trip_purpose"), "Trip Purpose*", ""
        )),
        column(
          6, textInput(ns("bike_frequency"), "Frequency of Bike Travel*", "")
        )),
        tags$br(),
        fluidRow(
          tags$div(
            shinyWidgets::actionBttn(
              ns("submit_btn_survey"),
              label = "Submit",
              color = "primary",
              size = "md",
              style = "material-flat"
            ),
            style = "padding: 0 20px 0 20px"
          ),
          shinyWidgets::actionBttn(
            ns("reset_btn_survey"),
            label = "Reset",
            color = "warning",
            size = "md",
            style = "material-flat"
          )
        )
        
      )
    )
  ))))
}

#' travelerSurveyModule Server Function
#'
#' @noRd
mod_travelerSurveyModule_server <-
  function(input, output, session, globals) {
    ns <- session$ns
    
    observe({
      if (is.null(input$name_survey) || input$name_survey == "" || 
          is.null(input$location_survey) || input$location_survey == "" || 
          is.null(input$trip_origin) || input$trip_origin == "" ||
          is.null(input$trip_destination) || input$trip_destination == "" ||
          is.null(input$trip_purpose) || input$trip_purpose == "" ||
          is.null(input$bike_frequency) || input$bike_frequency == "" ) {
        shinyjs::disable("submit_btn_survey")
      } else {
        shinyjs::enable("submit_btn_survey")
      }
    })
    
    # Get system time
    observeEvent(input$to_current_time, {
      shinyTime::updateTimeInput(session, "time_input1", value = Sys.time())
    })
    
    observeEvent(input$submit_btn_survey, {
      db_conn <- globals$stash$conn
      
      sqlQueryStrSurvey <-
        "insert into TravelerSurvey (SurveyDate, SurveyTime, VolunteerName, Location,
      TripOrigin, TripDestination, TripPurpose, BikeFrequency) values (?survey_date, ?survey_time, ?volunteer_name,
      ?location, ?trip_origin, ?trip_destination, ?trip_purpose, ?bike_frequency)"
      
      sqlQuery <- DBI::sqlInterpolate(
        db_conn,
        sqlQueryStrSurvey,
        survey_date = as.character(input$date_survey),
        survey_time = as.character(strftime(input$time_input1, "%T")),
        volunteer_name = input$name_survey,
        location = input$location_survey,
        trip_origin = input$trip_origin,
        trip_destination = input$trip_destination,
        trip_purpose = input$trip_purpose,
        bike_frequency = input$bike_frequency
      )
      
      dbout <- DBI::dbGetQuery(db_conn, sqlQuery)
      
      
      showModal(
        modalDialog(
          title = "Submit Message",
          paste("Data entered into the database:", dbout),
          footer = shinyWidgets::actionBttn(ns("closeModalBtn"), "Close",
                                            color = "success",
                                            size = "md",
                                            style = "material-flat")
        )
      )
      
      
      
    })
    
    observeEvent(input$reset_btn_survey, {
      resetInputUI()
    })
    
    observeEvent(input$closeModalBtn, {
      
      removeModal() 
      resetInputUI()
      
    })
    
    resetInputUI <- function() {
      # reset all the widgets
      shinyjs::reset("date_survey")
      shinyjs::reset("time_input1")
      shinyjs::reset("name_survey")
      shinyjs::reset("location_survey")
      shinyjs::reset("trip_origin")
      shinyjs::reset("trip_destination")
      shinyjs::reset("trip_purpose")
      shinyjs::reset("bike_frequency")
      
    }
    
  }

## To be copied in the UI
# mod_travelerSurveyModule_ui("travelerSurveyModule_ui_1")

## To be copied in the server
# callModule(mod_travelerSurveyModule_server, "travelerSurveyModule_ui_1")
