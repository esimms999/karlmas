#' Define user interface
#' @import bslib
#' @import bsicons
#' @importFrom fs dir_tree
#' @import shiny
#' @importFrom htmltools includeHTML includeMarkdown tags

karlmas_ui <- function() {

  # addResourcePath(
  #   prefix = 'www',
  #   directoryPath = system.file('www', package = 'karlmas'))

  fs::dir_tree(fs::path_package(package = "karlmas"))
  cat(getwd())

  page_sidebar(
    title = "Karlmas Calculator",
    bg = "lightblue",
    open = "closed",
    fillable = FALSE,
    fluid = FALSE,
    collapsible = FALSE,

    sidebar = selectInput(
      inputId = "selected_year",
      label = "Select Year:",
      choices = available_years,
      selected = "2024",
      multiple = FALSE
    ),

    navset_card_pill(
      title = "",
      nav_panel("Calculator",
                layout_columns(
                  fill = FALSE,
                  value_box(
                    title = "Year",
                    value = textOutput("year_selected"),
                    color = "blue",                       # Does not seem to work :(
                    showcase = bsicons::bs_icon("calendar")
                  ),
                  value_box(
                    title = "Starts at sundown",
                    value = textOutput("karlmas_start"),
                    showcase = bsicons::bs_icon("sunset")
                  ),
                  value_box(
                    title = "Ends at sunrise",
                    value = textOutput("karlmas_end"),
                    showcase = bsicons::bs_icon("sunrise")
                  ),
                  value_box(
                    title = "Gifts suggested",
                    value = textOutput("karlmas_gifts"),
                    showcase = bsicons::bs_icon("gift")
                    ),
                  )
                ),
      # nav_panel("About", htmltools::includeHTML(path = 'inst/www/about.html'))
      nav_panel("About", uiOutput("about_text"))

      #nav_panel("About", htmltools::includeMarkdown("inst/www/about.md"))

      # nav_panel("About", shiny::tags$iframe(
      #   src="./inst/www/about.html"
      #   )
      # )
    )
    )
}


