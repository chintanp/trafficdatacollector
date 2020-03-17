#' summaryModule UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_summaryModule_ui <- function(id) {
  ns <- NS(id)
  tagList(fluidRow(column(
    12,
    bs4Dash::bs4Card(
      title = "Summary Counts Table",
      closable = FALSE,
      status = "purple",
      collapsible = TRUE,
      elevation = 4,
      width = NULL,
      div(id = "summaryDiv",
          DT::dataTableOutput(ns("summaryTable")))
    )
  )),
  fluidRow(column(
    12,
    bs4Dash::bs4Card(
      title = "Summary Traveler Survey",
      closable = FALSE,
      status = "warning",
      collapsible = TRUE,
      elevation = 4,
      width = NULL,
      DT::dataTableOutput(ns("summarySurvey"))
      
    )
  )))
}

#' summaryModule Server Function
#'
#' @noRd
mod_summaryModule_server <-
  function(input, output, session, globals) {
    ns <- session$ns
    
    output$summaryTable = DT::renderDataTable({
      db_conn = globals$stash$conn
      counts <- DBI::dbReadTable(db_conn, "Counts")
      DT::datatable(
        counts,
        selection = "none",
        # filter = 'top',
        options = list(
          pageLength = 10,
          autoWidth = TRUE,
          scrollX = TRUE,
          scrollCollapse = TRUE,
          columnDefs = list(list(
            className = 'dt-center', targets = "_all"
          )),
          dom = 'Bfrtip',
          # buttons = c('colvis'),
          
          initComplete = DT::JS(
            "function(settings, json) {",
            "$(this.api().table().header()).css({'background-color': '#EBECEC', 'color': '#000'});",
            "}"
          )
        ),
        class = 'nowrap display',
        extensions = c('Buttons')
      )
      
    })
    
    output$summarySurvey = DT::renderDataTable({
      db_conn = globals$stash$conn
      traveler_survey <- DBI::dbReadTable(db_conn, "TravelerSurvey")
      DT::datatable(
        traveler_survey,
        selection = "none",
        # filter = 'top',
        options = list(
          pageLength = 10,
          # autoWidth = TRUE,
          # scrollX = TRUE,
          # scrollCollapse = TRUE,
          columnDefs = list(list(
            className = 'dt-center', targets = "_all"
          )),
          dom = 'Bfrtip',
          # buttons = c('colvis'),
          
          initComplete = DT::JS(
            "function(settings, json) {",
            "$(this.api().table().header()).css({'background-color': '#EBECEC', 'color': '#000'});",
            "}"
          )
        ),
        extensions = c('Buttons')
      )
    })
    
    return (list(input, updateTable = function(dataRow) {
      proxy1 <- DT::dataTableProxy('summaryTable')
      print(dataRow)
      DT::replaceData(proxy1, dataRow)
    }))
    
  }

## To be copied in the UI
# mod_summaryModule_ui("summaryModule_ui_1")

## To be copied in the server
# callModule(mod_summaryModule_server, "summaryModule_ui_1")
