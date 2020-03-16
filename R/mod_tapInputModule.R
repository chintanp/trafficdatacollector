#' tapInputModule UI Function
#'
#' @description This module has functionality for tap inputs
#' from user for traffic data.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_tapInputModule_ui <- function(id) {
  ns <- NS(id)
  tagList(shiny::fluidRow(column(
    12,
    bs4Dash::bs4Card(
      title = "Direction Counter",
      closable = FALSE,
      status = "purple",
      collapsible = TRUE,
      elevation = 4,
      width = NULL,
      solidHeader = TRUE,
      maximizable = TRUE,
      # HTML('<div style="position:relative; height: 600px">
      #           <img src="https://lh3.googleusercontent.com/qdaS4UKvUbJ8gW7rxzpVgntTzWdklBfnGwu0UwFoRskx62UuRbKFfEXaJo_OoRgRv7NAv5TnnjVR98vQGeFS9XSzuxlGsjQMGA8_BDg9wcRMYIinQ4YWD4KfyGiBdR-lzKQ6_K9I0A=w2400" height="200px"
      #   style="position:absolute; top:10px; left: 20px; opacity:0.4;filter:alpha(opacity=40);"/>
      #           <img src="https://lh3.googleusercontent.com/qdaS4UKvUbJ8gW7rxzpVgntTzWdklBfnGwu0UwFoRskx62UuRbKFfEXaJo_OoRgRv7NAv5TnnjVR98vQGeFS9XSzuxlGsjQMGA8_BDg9wcRMYIinQ4YWD4KfyGiBdR-lzKQ6_K9I0A=w2400" height="200px"
      #   style="position:absolute; top:350px; left: 20px; opacity:0.4;filter:alpha(opacity=40); "/>
      #           <img src="https://lh3.googleusercontent.com/qdaS4UKvUbJ8gW7rxzpVgntTzWdklBfnGwu0UwFoRskx62UuRbKFfEXaJo_OoRgRv7NAv5TnnjVR98vQGeFS9XSzuxlGsjQMGA8_BDg9wcRMYIinQ4YWD4KfyGiBdR-lzKQ6_K9I0A=w2400" height="200px"
      #   style="position:absolute; top:10px; left: 350px; opacity:0.4;filter:alpha(opacity=40);"/>
      #           <img src="https://lh3.googleusercontent.com/qdaS4UKvUbJ8gW7rxzpVgntTzWdklBfnGwu0UwFoRskx62UuRbKFfEXaJo_OoRgRv7NAv5TnnjVR98vQGeFS9XSzuxlGsjQMGA8_BDg9wcRMYIinQ4YWD4KfyGiBdR-lzKQ6_K9I0A=w2400" height="200px"
      #   style="position:absolute; top:350px; left: 350px; opacity:0.4;filter:alpha(opacity=40);"/>
      #      </div>')
      # icon("square", "fa-10x"),
      # icon("caret-left", "fa-10x"),
      # icon("caret-down", "fa-10x"),
      # icon("caret-left", "fa-10x"),
      
      # top row
      fluidRow(
        tags$i(class = "fa fa-square fa-10x",
               style = " padding: 0px 10px 0px 10px"),
        shinyWidgets::actionBttn(
          ns("north_left_btn"),
          0,
          color = "primary",
          style = "bordered",
          
          block = FALSE,
          size = "sm",
          tags$i(class = "fa fa-caret-left fa-10x",
                 style = "color: rgb(0,166,90); padding: 0px 10px 0px 10px")
        ),
        shinyWidgets::actionBttn(
          ns("north_down_btn"),
          0,
          color = "primary",
          style = "bordered",
          
          block = FALSE,
          size = "sm",
          tags$i(class = "fa fa-caret-down fa-10x",
                 style = "color: rgb(0,166,90); padding: 0px 10px 0px 10px")
        ),
        shinyWidgets::actionBttn(
          ns("north_right_btn"),
          0,
          color = "primary",
          style = "bordered",
          
          block = FALSE,
          size = "sm",
          tags$i(class = "fa fa-caret-right fa-10x",
                 style = "color: rgb(0,166,90); padding: 0px 10px 0px 10px")
        ),
        tags$i(class = "fa fa-square fa-10x",
               style = "padding: 0px 10px 0px 10px"),
        img(
          src = "https://image.flaticon.com/icons/svg/731/731590.svg",
          width = "200px",
          height = "200px",
          style = "padding: 40px"
        )
      ),
      fluidRow(
        tags$div(
          shinyWidgets::actionBttn(
            ns("west_up_btn"),
            0,
            color = "primary",
            style = "bordered",
            
            block = FALSE,
            size = "sm",
            tags$i(class = "fa fa-caret-up fa-10x",
                   style = "color: rgb(0,166,90); padding: 0px; border: 0px; margin: 0px")
          ),
          style = "padding: 0px 400px 0px 20px;"
        ),
        shinyWidgets::actionBttn(
          ns("east_up_btn"),
          0,
          color = "primary",
          style = "bordered",
          
          block = FALSE,
          size = "sm",
          tags$i(class = "fa fa-caret-up fa-10x",
                 style = "color: rgb(0,166,90); padding: 0px; border: 0px; margin: 0px")
        )
      ),
      
      fluidRow(
        tags$div(
          shinyWidgets::actionBttn(
            ns("west_right_btn"),
            0,
            color = "primary",
            style = "bordered",
            
            block = FALSE,
            size = "sm",
            tags$i(class = "fa fa-caret-right fa-10x",
                   style = "color: rgb(0,166,90); padding: 0px; border: 0px; margin: 0px")
          ),
          style = "padding: 0px 450px 0px 20px;"
        ),
        shinyWidgets::actionBttn(
          ns("east_left_btn"),
          0,
          color = "primary",
          style = "bordered",
          
          block = FALSE,
          size = "sm",
          tags$i(class = "fa fa-caret-left  fa-10x",
                 style = "color: rgb(0,166,90); padding: 0px; border: 0px; margin: 0px")
        )
      ),
      fluidRow(
        tags$div(
          shinyWidgets::actionBttn(
            ns("west_down_btn"),
            0,
            color = "primary",
            style = "bordered",
            
            block = FALSE,
            size = "sm",
            tags$i(class = "fa fa-caret-down fa-10x",
                   style = "color: rgb(0,166,90); padding: 0px; border: 0px; margin: 0px")
          ),
          style = "padding: 0px 400px 0px 20px;"
        ),
        shinyWidgets::actionBttn(
          ns("east_down_btn"),
          0,
          color = "primary",
          style = "bordered",
          
          block = FALSE,
          size = "sm",
          tags$i(class = "fa fa-caret-down  fa-10x",
                 style = "color: rgb(0,166,90); padding: 0px; border: 0px; margin: 0px")
        )
      ),
      
      # bottom row
      fluidRow(
        tags$i(class = "fa fa-square fa-10x",
               style = " padding: 0px 10px 0px 10px"),
        shinyWidgets::actionBttn(
          ns("south_left_btn"),
          0,
          color = "primary",
          style = "bordered",
          
          block = FALSE,
          size = "sm",
          tags$i(class = "fa fa-caret-left fa-10x",
                 style = "color: rgb(0,166,90); padding: 0px 10px 0px 10px")
        ),
        shinyWidgets::actionBttn(
          ns("south_up_btn"),
          0,
          color = "primary",
          style = "bordered",
          
          block = FALSE,
          size = "sm",
          tags$i(class = "fa fa-caret-up fa-10x",
                 style = "color: rgb(0,166,90); padding: 0px 10px 0px 10px")
        ),
        shinyWidgets::actionBttn(
          ns("south_right_btn"),
          0,
          color = "primary",
          style = "bordered",
          
          block = FALSE,
          size = "sm",
          tags$i(class = "fa fa-caret-right fa-10x",
                 style = "color: rgb(0,166,90); padding: 0px 10px 0px 10px")
        ),
        tags$i(class = "fa fa-square fa-10x",
               style = " padding: 0px 10px 0px 10px")
      ),
      tags$br(),
      fluidRow(
        tags$div(
        shinyWidgets::actionBttn(ns("submit_btn"), label = "Submit", color = "primary", size="md", style = "material-flat"), style = "padding: 0 20px 0 20px"), 
        shinyWidgets::actionBttn(ns("reset_btn"), label = "Reset", color = "warning", size="md", style = "material-flat")
      )
      
      #imageOutput("rect1", width = "100%", height = "400px")
    )
  )))
  
}

#' tapInputModule Server Function
#'
#' @noRd
mod_tapInputModule_server <-
  function(input, output, session, globals) {
    ns <- session$ns
    
    #
    # Wait for a button click
    
    # North
    observeEvent(input$north_left_btn, {
      globals$stash$north_left_count <- globals$stash$north_left_count + 1
      updateActionButton(session,
                         "north_left_btn",
                         label = as.character(globals$stash$north_left_count))
      
    })
    
    observeEvent(input$north_down_btn, {
      globals$stash$north_down_count <- globals$stash$north_down_count + 1
      updateActionButton(session,
                         "north_down_btn",
                         label = as.character(globals$stash$north_down_count))
      
    })
    
    observeEvent(input$north_right_btn, {
      globals$stash$north_right_count <-
        globals$stash$north_right_count + 1
      updateActionButton(session,
                         "north_right_btn",
                         label = as.character(globals$stash$north_right_count))
      
    })
    
    # East
    observeEvent(input$east_up_btn, {
      globals$stash$east_up_count <- globals$stash$east_up_count + 1
      updateActionButton(session,
                         "east_up_btn",
                         label = as.character(globals$stash$east_up_count))
      
    })
    
    observeEvent(input$east_left_btn, {
      globals$stash$east_left_count <- globals$stash$east_left_count + 1
      updateActionButton(session,
                         "east_left_btn",
                         label = as.character(globals$stash$east_left_count))
      
    })
    
    observeEvent(input$east_down_btn, {
      globals$stash$east_down_count <- globals$stash$east_down_count + 1
      updateActionButton(session,
                         "east_down_btn",
                         label = as.character(globals$stash$east_down_count))
      
    })
    
    # South
    observeEvent(input$south_left_btn, {
      globals$stash$south_left_count <- globals$stash$south_left_count + 1
      updateActionButton(session,
                         "south_left_btn",
                         label = as.character(globals$stash$south_left_count))
      
    })
    
    observeEvent(input$south_right_btn, {
      globals$stash$south_right_count <-
        globals$stash$south_right_count + 1
      updateActionButton(session,
                         "south_right_btn",
                         label = as.character(globals$stash$south_right_count))
      
    })
    
    observeEvent(input$south_up_btn, {
      globals$stash$south_up_count <- globals$stash$south_up_count + 1
      updateActionButton(session,
                         "south_up_btn",
                         label = as.character(globals$stash$south_up_count))
      
    })
    
    # West
    observeEvent(input$west_up_btn, {
      globals$stash$west_up_count <- globals$stash$west_up_count + 1
      updateActionButton(session,
                         "west_up_btn",
                         label = as.character(globals$stash$west_up_count))
      
    })
    
    observeEvent(input$west_right_btn, {
      globals$stash$west_right_count <- globals$stash$west_right_count + 1
      updateActionButton(session,
                         "west_right_btn",
                         label = as.character(globals$stash$west_right_count))
      
    })
    
    observeEvent(input$west_down_btn, {
      globals$stash$west_down_count <- globals$stash$west_down_count + 1
      updateActionButton(session,
                         "west_down_btn",
                         label = as.character(globals$stash$west_down_count))
      
    })
    
    observeEvent(input$submit_btn, {
      print("submitted")
      print(globals$stash$name)
      print(globals$stash$date)
      print(globals$stash$time)
      print(globals$stash$temperature)
      print(globals$stash$location)
      print(globals$stash$notes)
      print(globals$stash$weather)
      validate(
        need(globals$stash$location != "", "Please select a location"),
        need(globals$stash$time != "", "Please select a time"),
        need(globals$stash$date != "", "Please select a date"), 
        need(globals$stash$weather != "", "Please select a weather"), 
        need(globals$stash$name != "", "Please enter a name")
      )
      db_conn = globals$stash$conn
      
      DBI::dbGetQuery(db_conn, "insert into ")
    })

  }

## To be copied in the UI
# mod_tapInputModule_ui("tapInputModule_ui_1")

## To be copied in the server
# callModule(mod_tapInputModule_server, "tapInputModule_ui_1")
