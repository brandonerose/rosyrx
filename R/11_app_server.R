#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  values<-reactiveValues()
  values$look <- "hey"
  output$html_test <- renderUI({
    tags$iframe(
      class = "pubchem-widget",
      src=paste0("https://pubchem.ncbi.nlm.nih.gov/compound/",input$CID,"#section=",input$dimensions,"&embed=true"),
      style="width: 450px; max-width: 100%; height: 650px;"
    )
  })
  if(golem::app_dev()){
    mod_list_server("input_list",values = input)
    mod_list_server("values_list",values = values)
  }
}
