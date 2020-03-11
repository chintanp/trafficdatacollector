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
      title = "Input Table",
      closable = FALSE,
      status = "purple",
      collapsible = TRUE,
      elevation = 4,
      width = NULL,
      maximizable = TRUE,
      fluidRow(
        bs4Dash::bs4Table(
          cardWrap = TRUE,
          bordered = TRUE,
          striped = TRUE,
          headTitles = c("Helmet",
                         "Male",
                         "Female",
                         "Total"),
          bs4Dash::bs4TableItems(
            bs4Dash::bs4TableItem("with helmet"),
            bs4Dash::bs4TableItem(dataCell = TRUE, ""),
            bs4Dash::bs4TableItem(
              dataCell = TRUE,
              ""
            ),
            bs4Dash::bs4TableItem(dataCell = TRUE,
                         ""))
          
        )
      )
    )
  )))
}

#' tableModule Server Function
#'
#' @noRd
mod_tableModule_server <- function(input, output, session) {
  ns <- session$ns
  
}

## To be copied in the UI
# mod_tableModule_ui("tableModule_ui_1")

## To be copied in the server
# callModule(mod_tableModule_server, "tableModule_ui_1")
