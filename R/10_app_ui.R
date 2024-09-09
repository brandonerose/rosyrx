#' @import RosyUtils
#' @import shiny
#' @import shinydashboard
custom_body_tabs <- function(){
  tabItem(
    "home",
    fluidRow(
      box(
        title = h1("Home"),
        width = 12,
        uiOutput("html_test")
      )
    )
  )
}
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui<- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    shinydashboardPlus::dashboardPage(
      options = list(
        sidebarExpandOnHover = F
      ),
      header = dbHeader(),
      sidebar = dbSidebar(
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
      ),
      body = dbBody(custom_body_tabs()),
      controlbar = dbControlbar(),
      footer = RosyUtils:::TCD_NF(),
      skin = "black"
    )
  )
}
