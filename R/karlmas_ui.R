#' Define user interface
#' @import bslib
#' @import bsicons
#' @importFrom fs dir_tree
#' @import shiny
#' @importFrom htmltools includeHTML includeMarkdown tags
#' @importFrom shinyWidgets radioGroupButtons

karlmas_ui <- function() {

  # addResourcePath(
  #   prefix = 'www',
  #   directoryPath = system.file('www', package = 'karlmas'))

  fs::dir_tree(fs::path_package(package = "karlmas"))
  cat(getwd())

  page_fillable(
    title = "Karlmas Calculator",
    fillable_mobile = TRUE,

    tags$div(
      id = "header-row",
      tags$h1("Karlmas Calculator", id = "app-title"),
      tags$div(
        id = "year-selector",
        shinyWidgets::radioGroupButtons(
          inputId = "selected_year",
          label = NULL,
          choices = c("2026", "2027", "2028", "2029", "2030", "2031",
                      "2032", "2033", "2034"),
          selected = "2026",
          justified = TRUE,
          size = "sm"
        )
      )
    ),
    tags$style(HTML("
      #header-row {
        display: flex;
        align-items: center;
        gap: 48px;
        flex-wrap: wrap;
      }
      #app-title {
        margin: 0;
        font-size: 1.5rem;
        white-space: nowrap;
      }
      #year-selector .btn-group-justified {
        display: grid !important;
        grid-template-columns: repeat(3, 1fr);
        gap: 4px;
        max-width: 280px;
      }
      #year-selector .btn-group-justified > .btn-group-toggle {
        width: 100%;
        margin: 0;
      }
      #year-selector .btn-group-justified .btn {
        padding: 2px 6px;
        font-size: 0.8rem;
      }
    ")),

    navset_card_pill(
      title = "",
      nav_panel("Calculator",
                layout_columns(
                  fill = FALSE,
                  col_widths = breakpoints(xs = 12, sm = 6, md = 3),
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


