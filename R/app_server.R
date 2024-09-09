#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  output$html_test <- renderUI({
    tags$iframe(
      class = "pubchem-widget",
      src=paste0("https://pubchem.ncbi.nlm.nih.gov/compound/",input$CID,"#section=",input$dimensions,"&embed=true"),
      style="width: 450px; max-width: 100%; height: 650px;"
    )
  })
}
