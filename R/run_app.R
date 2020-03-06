#' Run the Shiny Application
#'
#' @param a,b test params used in run_app
#'
#' @export
#' @importFrom shiny shinyApp
#' @importFrom golem with_golem_options
run_app <- function(
  a = 12, 
  b = 13
) {
  options(shiny.port = 8100)
  options(shiny.host = ipify::get_ip())
  with_golem_options(
    app = shinyApp(
      ui = app_ui, 
      server = app_server
    ), 
    golem_opts = list(
      a = a, 
      b = b
    )
  )
}
