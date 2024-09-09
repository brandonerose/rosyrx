#' @import RosyUtils
#' @import shiny
#' @import shinydashboard
custom_sidebar <- function(){
  sidebarMenu(
      id="sb1",
      menuItem(
        text="Home",
        tabName = "home",
        icon =shiny::icon("home")
      ),
      conditionalPanel(
        "input.sb1 === 'home'",
        selectInput(
          "dimensions",
          label = "Structure",
          choices = c("2D-Structure","3D-Conformer"),
          selected = "2D-Structure"
        )
      )
    )
}
