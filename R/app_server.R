#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # List the first level callModules here
  callModule(mod_formModule_server, "formModule_ui_1")
  callModule(mod_tableModule_server, "tableModule_ui_1")
  callModule(mod_tapInputModule_server, "tapInputModule_ui_1")
  
  observeEvent(input$alert,{
    golem::invoke_js("alert", "Yaya!")
  })
  
}
