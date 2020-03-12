#' summaryModule UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_summaryModule_ui <- function(id){
  ns <- NS(id)
  tagList(fluidRow(column(
    12,
    bs4Dash::bs4Card(
      title = "Summary Table",
      closable = FALSE,
      status = "purple",
      collapsible = TRUE,
      elevation = 4,
      width = NULL,
      solidHeader = TRUE, 
      div(
        id = "summaryDiv",
        DT::dataTableOutput(ns("summaryTable"))
      )
    )
  )))
}
    
#' summaryModule Server Function
#'
#' @noRd 
mod_summaryModule_server <- function(input, output, session, globals){
  ns <- session$ns
  
  output$summaryTable = DT::renderDataTable({
    db_conn = globals$stash$conn
    locations <- DBI::dbReadTable(db_conn, "Locations")
    locations
  })
 
}
    
## To be copied in the UI
# mod_summaryModule_ui("summaryModule_ui_1")
    
## To be copied in the server
# callModule(mod_summaryModule_server, "summaryModule_ui_1")
 
