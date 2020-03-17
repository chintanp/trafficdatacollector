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
      solidHeader = TRUE,
      div(id = "summaryDiv",
          DT::dataTableOutput(ns("summaryTable")))
    )
  )),
  fluidRow(column(
    12,
    bs4Dash::bs4Card(
      title = "Summary Counts Graph",
      closable = FALSE,
      status = "purple",
      collapsible = TRUE,
      elevation = 4,
      width = NULL,
      solidHeader = TRUE,
      fluidRow(column(3,
                      fluidRow(
                        
                      )), column(9,
                                 plotOutput(
                                   outputId = ns("summary_graph")
                                 )))
      
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
        filter = 'top',
        options = list(
          pageLength = 10,
          autoWidth = TRUE,
          scrollX = TRUE,
          scrollCollapse = TRUE,
          select = list(style = 'os', items = 'row'),
          columnDefs = list(list(
            className = 'dt-center', targets = "_all"
          )),
          dom = 'Bfrtip',
          buttons = c('colvis'),
          fixedColumns = list(leftColumns = 6),
          initComplete = DT::JS(
            "function(settings, json) {",
            "$(this.api().table().header()).css({'background-color': '#EBECEC', 'color': '#000'});",
            "}"
          )
        ),
        class = 'nowrap display',
        extensions = c('Buttons', 'FixedColumns', 'Select')
      )
      
    })
    
  }

## To be copied in the UI
# mod_summaryModule_ui("summaryModule_ui_1")

## To be copied in the server
# callModule(mod_summaryModule_server, "summaryModule_ui_1")
