#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  male_helmet_count <- 0
  GlobalData = callModule(GlobalModule, "globals")
  # List the first level callModules here
  callModule(mod_formModule_server, "formModule_ui_1", GlobalData)
  callModule(mod_tableModule_server, "tableModule_ui_1", GlobalData)
  callModule(mod_tapInputModule_server, "tapInputModule_ui_1", GlobalData)
  callModule(mod_summaryModule_server, "summaryModule_ui_1", GlobalData)
  

  
  observeEvent(input$alert,{
    golem::invoke_js("alert", "Yaya!")
  })
  
}
