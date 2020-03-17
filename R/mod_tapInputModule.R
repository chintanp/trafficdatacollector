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
               style = "color: rgb(0,166,90); padding: 10px"),
        shinyWidgets::actionBttn(
          ns("north_left_btn"),
          0,
          color = "primary",
          #MIKE MOD options “default”, “primary”, “warning”, “danger”, “success”, “royal”
          style = "minimal",
          # MIKE MOD options=“simple”, “bordered”, “minimal”, “stretch”, “jelly”, “gradient”, “fill”, “material-circle”, “material-flat”, “pill”, “float”, “unite”
          
          block = FALSE,
          size = "sm",
          tags$i(class = "fa fa-angle-left fa-5x", #MIKE MOD
                 style = "color: rgb(0,166,90); padding: 20px") #MIKE MOD
        ),
        shinyWidgets::actionBttn(
          ns("north_down_btn"),
          0,
          color = "primary",
          style = "minimal",
          
          block = FALSE,
          size = "sm",
          tags$i(class = "fa fa-angle-down fa-5x",
                 style = "color: rgb(0,166,90); padding: 20px")
          
        ),
        shinyWidgets::actionBttn(
          ns("north_right_btn"),
          0,
          color = "primary",
          style = "minimal",
          
          block = FALSE,
          size = "sm",
          tags$i(class = "fa fa-angle-right fa-5x",
                 style = "color: rgb(0,166,90); padding: 20px")
        ),
        tags$i(class = "fa fa-square fa-10x",
               style = "color: rgb(0,166,90); padding: 10px"),
        #MIKEMOD ADDED PADDING
        img(
          src = "https://image.flaticon.com/icons/svg/731/731590.svg",
          width = "200px",
          height = "200px",
          style = "padding: 40px"
        )
      ),
      
      fluidRow(
        shinyWidgets::actionBttn(
          ns("west_up_btn"),
          0,
          color = "primary",
          style = "minimal",
          
          block = FALSE,
          size = "sm",
          tags$i(class = "fa fa-angle-up fa-5x",
                 style = "color: rgb(0,166,90); padding: 0px 60px 0px 20px; border: 0px; margin: 0px") #mike mod 400=60
        ),
        ## MIKES ATTEMPT:
        fluidRow(
          shinyWidgets::actionBttn(
            ns("filler_bUtton"),
            0,
            color = "default",
            #MIKE MOD options “default”, “primary”, “warning”, “danger”, “success”, “royal”
            style = "minimal",
            # MIKE MOD options=“simple”, “bordered”, “minimal”, “stretch”, “jelly”, “gradient”, “fill”, “material-circle”, “material-flat”, “pill”, “float”, “unite”
            
            block = FALSE,
            size = "sm",
            tags$i(class = "fas fa-biking fa-5x", #MIKE MOD
                   style = "color: rgb(0,166,90); padding: 0px 330px 0px 0px") #MIKE MOD
          )
          
        ),
        ## END ATTEMPT
        shinyWidgets::actionBttn(
          ns("east_up_btn"),
          0,
          color = "primary",
          style = "minimal",
          
          block = FALSE,
          size = "sm",
          tags$i(class = "fa fa-angle-up fa-5x",
                 style = "color: rgb(0,166,90); padding: 0px 60px 0px 20px; border: 0px; margin: 0px") #MIKEMOD
        )
      ),
      
      fluidRow(
        shinyWidgets::actionBttn(
          ns("west_right_btn"),
          0,
          color = "primary",
          style = "minimal",
          
          block = FALSE,
          size = "sm",
          tags$i(class = "fa fa-angle-right fa-5x",
                 style = "color: rgb(0,166,90); padding: 0px 60px 0px 20px; border: 0px; margin: 0px") #MIKEMOD
        ),
        ## MIKES ATTEMPT:
        fluidRow(
          shinyWidgets::actionBttn(
            ns("filler_bUtton"),
            0,
            color = "default",
            #MIKE MOD options “default”, “primary”, “warning”, “danger”, “success”, “royal”
            style = "minimal",
            # MIKE MOD options=“simple”, “bordered”, “minimal”, “stretch”, “jelly”, “gradient”, “fill”, “material-circle”, “material-flat”, “pill”, “float”, “unite”
            
            block = FALSE,
            size = "sm",
            tags$i(class = "fas fa-biking fa-5x", #MIKE MOD
                   style = "color: rgb(0,166,90); padding: 0px 330px 0px 0px") #MIKE MOD
          )
          
        ),
        ## END ATTEMPT
        shinyWidgets::actionBttn(
          ns("east_left_btn"),
          0,
          color = "primary",
          style = "minimal",
          
          block = FALSE,
          size = "sm",
          tags$i(class = "fa fa-angle-left  fa-5x",
                 style = "color: rgb(0,166,90); padding: 0px 60px 0px 20px; border: 0px; margin: 0px") #MIKEMOD
        )
      ),
      fluidRow(
        shinyWidgets::actionBttn(
          ns("west_down_btn"),
          0,
          color = "primary",
          style = "minimal",
          
          block = FALSE,
          size = "sm",
          tags$i(class = "fa fa-angle-down fa-5x",
                 style = "color: rgb(0,166,90);padding: 0px 60px 0px 20px; border: 0px; margin: 0px")
          
        ),
        ## MIKES ATTEMPT:
        fluidRow(
          shinyWidgets::actionBttn(
            ns("filler_bUtton"),
            0,
            color = "default",
            #MIKE MOD options “default”, “primary”, “warning”, “danger”, “success”, “royal”
            style = "minimal",
            # MIKE MOD options=“simple”, “bordered”, “minimal”, “stretch”, “jelly”, “gradient”, “fill”, “material-circle”, “material-flat”, “pill”, “float”, “unite”
            
            block = FALSE,
            size = "sm",
            tags$i(class = "fas fa-biking fa-5x", #MIKE MOD
                   style = "color: rgb(0,166,90); padding: 0px 330px 0px 0px") #MIKE MOD
          )
          
        ),
        ## END ATTEMPT
        shinyWidgets::actionBttn(
          ns("east_down_btn"),
          0,
          color = "primary",
          style = "minimal",
          
          block = FALSE,
          size = "sm",
          tags$i(class = "fa fa-angle-down  fa-5x",
                 style = "color: rgb(0,166,90); padding: 0px 60px 0px 20px; border: 0px; margin: 0px")
        )
      ),
      
      # bottom row
      fluidRow(
        tags$i(class = "fa fa-square fa-10x",
               style = "color: rgb(0,166,90); padding: 10px"),
        #MIKEMOD added padding
        shinyWidgets::actionBttn(
          ns("south_left_btn"),
          0,
          color = "primary",
          style = "minimal",
          
          block = FALSE,
          size = "sm",
          
          tags$i(class = "fa fa-angle-left fa-5x",
                 style = "color: rgb(0,166,90); padding: 20px")
          
        ),
        shinyWidgets::actionBttn(
          ns("south_up_btn"),
          0,
          color = "primary",
          style = "minimal",
          
          block = FALSE,
          size = "sm",
          
          tags$i(class = "fa fa-angle-up fa-5x",
                 style = "color: rgb(0,166,90); padding: 10px")
          
        ),
        shinyWidgets::actionBttn(
          ns("south_right_btn"),
          0,
          color = "primary",
          style = "minimal",
          
          block = FALSE,
          size = "sm",
          
          tags$i(class = "fa fa-angle-right fa-5x",
                 style = "color: rgb(0,166,90); padding: 20px")
        ),
        tags$i(class = "fa fa-square fa-10x",
               style = " color: rgb(0,166,90); padding: 10px")
      ),
      tags$br(),
      fluidRow(
        tags$div(
          shinyWidgets::actionBttn(
            ns("submit_btn"),
            label = "Submit",
            color = "primary",
            size = "md",
            style = "material-flat"
          ),
          style = "padding: 0 20px 0 20px"
        ),
        shinyWidgets::actionBttn(
          ns("reset_btn"),
          label = "Reset",
          color = "warning",
          size = "md",
          style = "material-flat"
        )
      )
      
      #imageOutput("rect1", width = "100%", height = "400px")
    )
  )))
  
}

#' tapInputModule Server Function
#'
#' @noRd
mod_tapInputModule_server <-
  function(input,
           output,
           session,
           globals,
           formInputs,
           tableInputs) {
    ns <- session$ns
    
    observe({
      if (is.null(formInputs[[1]]$name) || formInputs[[1]]$name == "") {
        shinyjs::disable("submit_btn")
      } else {
        shinyjs::enable("submit_btn")
      }
    })
    
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
      location_id <-
        globals$stash$locations$LocationID[globals$stash$locations$Intersection == globals$stash$location]
      # validate(
      #   need(globals$stash$location != "", "Please select a location"),
      #   need(globals$stash$time != "", "Please select a time"),
      #   need(globals$stash$date != "", "Please select a date"),
      #   need(globals$stash$weather != "", "Please select a weather"),
      #   need(globals$stash$name != "", "Please enter a name")
      # )
      db_conn <- globals$stash$conn
      
      sqlQueryStr <-
        "insert into Counts (LocationID, Volunteer, Date, Weather, TimePeriod, NorthBoundLeft, NorthBoundRight, NorthBoundThrough,
      SouthBoundLeft, SouthBoundRight, SouthBoundThrough, EastBoundLeft, EastBoundRight, EastBoundThrough,
      WestBoundLeft, WestBoundRight, WestBoundThrough, HelmetMale, HelmetFemale, NoHelmetMale, NoHelmetFemale) values
      (?location_id, ?name, ?date, ?weather, ?time_period, ?north_bound_left, ?north_bound_right, ?north_bound_through, ?south_bound_left,
      ?south_bound_right, ?south_bound_through, ?east_bound_left, ?east_bound_right, ?east_bound_through, ?west_bound_left, ?west_bound_right,
      ?west_bound_through, ?helmet_male, ?helmet_female, ?no_helmet_male, ?no_helmet_female)"
      
      print(typeof(globals$stash$date))
      
      sqlQuery <- DBI::sqlInterpolate(
        db_conn,
        sqlQueryStr,
        location_id = location_id,
        name = globals$stash$name,
        date = as.POSIXct(paste(globals$stash$date, "00:00:00"), format="%Y-%m-%d %H:%M:%S"),
        weather = paste(
          as.character(globals$stash$temperature),
          globals$stash$weather,
          sep = ", "
        ),
        time_period = globals$stash$time,
        north_bound_left = globals$stash$south_left_count,
        north_bound_right = globals$stash$south_right_count,
        north_bound_through = globals$stash$south_up_count,
        south_bound_left = globals$stash$north_left_count,
        south_bound_right = globals$stash$north_right_count,
        south_bound_through = globals$stash$north_down_count,
        east_bound_left = globals$stash$west_up_count,
        east_bound_right = globals$stash$west_down_count,
        east_bound_through = globals$stash$west_right_count,
        west_bound_left = globals$stash$east_down_count,
        west_bound_right = globals$stash$east_up_count,
        west_bound_through = globals$stash$east_left_count,
        helmet_male = globals$stash$male_helmet_count,
        helmet_female = globals$stash$female_helmet_count,
        no_helmet_male = globals$stash$male_no_helmet_count,
        no_helmet_female = globals$stash$female_no_helmet_count
      )
      
      dbout <- DBI::dbGetQuery(db_conn, sqlQuery)
      
      showModal(modalDialog(
        title = "Submit Message",
        paste("Data entered into the database:", dbout),
        footer = shinyWidgets::actionBttn(
          ns("closeModalBtn"),
          "Close",
          color = "success",
          size = "md",
          style = "material-flat"
        )
      ))
      
      
      
    })
    
    observeEvent(input$reset_btn, {
      resetInputUI()
    })
    
    observeEvent(input$closeModalBtn, {
      removeModal()
      resetInputUI()
      
    })
    
    resetInputUI <- function() {
      # reset all the widgets
      inputElements <-
        c(
          "north_right_btn",
          "north_left_btn",
          "north_down_btn",
          "east_left_btn",
          "east_up_btn",
          "east_down_btn",
          "south_right_btn",
          "south_left_btn",
          "south_up_btn",
          "west_right_btn",
          "west_up_btn",
          "west_down_btn"
        )
      
      for (str in inputElements) {
        updateActionButton(session, inputId = str, label = 0)
      }
      
      tableInputs$resetHelmetElements()
      
      formInputs$resetFormElements()
      
    }
    
  }

## To be copied in the UI
# mod_tapInputModule_ui("tapInputModule_ui_1")

## To be copied in the server
# callModule(mod_tapInputModule_server, "tapInputModule_ui_1")
