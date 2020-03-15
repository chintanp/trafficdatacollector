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
      title = "Input Form",
      closable = FALSE,
      status = "purple",
      collapsible = TRUE,
      elevation = 4,
      width = NULL,
      solidHeader = TRUE, 
      div(
        id = "form",
        fluidRow(
          column(4, textInput("location", "Location", "")
                 ),
          column(4, dateInput("date3", "Date", format = "mm/dd/yyyy")
          ),
          column(4, textInput("time", "Time", "")
          )
        ),
        fluidRow(
          column(4, selectInput("weather",
                                "Weather",
                                c("Sunny", "Partly Cloudy","Cloudy","Raining","Snowing"),
                                selected = "sunny",
                                multiple = FALSE),
                                
          ),
          column(4, textInput("name", "Name", "")
          ),
          column(4, textInput("notes", "Notes", "")
          ),
          column(4,selectInput("actTemp",
                                "Temperature",
                                c("Below Zero","0-20","20-32","32-50","50-62","62-75","75-85","85-100","100+"),
                                selected = "62-75",
                                multiple = FALSE),
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
  print("this")

}

## To be copied in the UI
# mod_formModule_ui("formModule_ui_1")

## To be copied in the server
# callModule(mod_formModule_server, "formModule_ui_1")
