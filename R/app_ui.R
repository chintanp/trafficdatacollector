#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  
  home_tab <- bs4Dash::bs4TabItem(tabName = "home_tab",
    mod_formModule_ui("formModule_ui_1"),
    mod_tableModule_ui("tableModule_ui_1"),
    mod_tapInputModule_ui("tapInputModule_ui_1")
  )
  
  summary_tab <- bs4Dash::bs4TabItem(tabName = "summary_tab", 
                                     mod_summaryModule_ui("summaryModule_ui_1"))
  
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here
    bs4Dash::bs4DashPage(
      enable_preloader = FALSE,
      navbar = bs4Dash::bs4DashNavbar(
        skin = "light",
        status = "white",
        border = TRUE,
        sidebarIcon = "bars",
        controlbarIcon = "th",
        fixed = FALSE
      ),
      sidebar = bs4Dash::bs4DashSidebar(
        skin = "light",
        status = "purple",
        title = "Traffic Data Entry Interface",
        brandColor = "purple",
        url = "",
        src = "",
        elevation = 3,
        opacity = 0.3,
        bs4Dash::bs4SidebarMenu(
          bs4Dash::bs4SidebarHeader(""),
          bs4Dash::bs4SidebarMenuItem("Home",
                             tabName = "home_tab",
                             icon = "home"),
          bs4Dash::bs4SidebarMenuItem("Summary",
                             tabName = "summary_tab",
                             icon = "chart-bar")
        )
      ),
      controlbar = bs4Dash::bs4DashControlbar(disable = TRUE),
      footer = bs4Dash::bs4DashFooter(
        copyrights = a(
          href = "https://github.com/chintanp/trafficdatacollector",
          target = "_blank",
          "Team 04 - CET 412/522,
            Araj Shrestha, Chintan Pathak, Caleb Trapp, Mike MacDowell"
        ),
        right_text = "2020"
      ),
      title = "test",
      body = bs4Dash::bs4DashBody(
        bs4Dash::bs4TabItems(
          home_tab, 
          summary_tab
        )
        
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path('www', app_sys('app/www'))
  
  tags$head(favicon(),
            bundle_resources(path = app_sys('app/www'),
                             app_title = 'trafficdatacollector') 
            # tags$script(src= "https://cdnjs.cloudflare.com/ajax/libs/two.js/0.6.0/two.min.js"))
            # Add here other external resources
            # for example, you can add shinyalert::useShinyalert() ))
  )
}
