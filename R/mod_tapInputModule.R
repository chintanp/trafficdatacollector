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
mod_tapInputModule_ui <- function(id){
  
  
  
  ns <- NS(id)
  tagList(
    shiny::fluidRow(column(
      12,
      bs4Dash::bs4Card(
        title = "Traffic data input",
        closable = FALSE,
        status = "purple",
        collapsible = TRUE,
        elevation = 4,
        width = NULL,
        solidHeader = TRUE, 
        HTML('<div style="position:relative; height: 600px"> 
                  <img src="https://lh3.googleusercontent.com/qdaS4UKvUbJ8gW7rxzpVgntTzWdklBfnGwu0UwFoRskx62UuRbKFfEXaJo_OoRgRv7NAv5TnnjVR98vQGeFS9XSzuxlGsjQMGA8_BDg9wcRMYIinQ4YWD4KfyGiBdR-lzKQ6_K9I0A=w2400" height="200px"    
          style="position:absolute; top:10px; left: 20px; opacity:0.4;filter:alpha(opacity=40);"/> 
                  <img src="https://lh3.googleusercontent.com/qdaS4UKvUbJ8gW7rxzpVgntTzWdklBfnGwu0UwFoRskx62UuRbKFfEXaJo_OoRgRv7NAv5TnnjVR98vQGeFS9XSzuxlGsjQMGA8_BDg9wcRMYIinQ4YWD4KfyGiBdR-lzKQ6_K9I0A=w2400" height="200px"    
          style="position:absolute; top:350px; left: 20px; opacity:0.4;filter:alpha(opacity=40); "/> 
                  <img src="https://lh3.googleusercontent.com/qdaS4UKvUbJ8gW7rxzpVgntTzWdklBfnGwu0UwFoRskx62UuRbKFfEXaJo_OoRgRv7NAv5TnnjVR98vQGeFS9XSzuxlGsjQMGA8_BDg9wcRMYIinQ4YWD4KfyGiBdR-lzKQ6_K9I0A=w2400" height="200px"    
          style="position:absolute; top:10px; left: 350px; opacity:0.4;filter:alpha(opacity=40);"/> 
                  <img src="https://lh3.googleusercontent.com/qdaS4UKvUbJ8gW7rxzpVgntTzWdklBfnGwu0UwFoRskx62UuRbKFfEXaJo_OoRgRv7NAv5TnnjVR98vQGeFS9XSzuxlGsjQMGA8_BDg9wcRMYIinQ4YWD4KfyGiBdR-lzKQ6_K9I0A=w2400" height="200px"    
          style="position:absolute; top:350px; left: 350px; opacity:0.4;filter:alpha(opacity=40);"/> 
             </div>')
        #imageOutput("rect1", width = "100%", height = "400px")
      )
    )))
  
}
    
#' tapInputModule Server Function
#'
#' @noRd 
mod_tapInputModule_server <- function(input, output, session){
  ns <- session$ns
  output$rect1 <- renderImage({
    # When input$n is 3, filename is ./images/image3.jpeg
    # filename <- normalizePath(file.path('./inst/app/grass.jpg'))
    
    # Return a list containing the filename and alt text
    list(src = './inst/app/grass.jpg',
         alt = "grass")
    
  }, deleteFile = FALSE)
}
    
## To be copied in the UI
# mod_tapInputModule_ui("tapInputModule_ui_1")
    
## To be copied in the server
# callModule(mod_tapInputModule_server, "tapInputModule_ui_1")
 
