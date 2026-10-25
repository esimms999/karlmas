# Define server logic

#' Title
#'
#' @importFrom dplyr filter
#' @importFrom htmltools HTML includeMarkdown includeHTML
#' @importFrom shinyjs hide show

karlmas_server <- function(input, output) {

  # Filter by selected year
  selected_year <- reactive({
    karlmas_data |>
      dplyr::filter(year %in% input$selected_year)
  })

  # value_box for selected year
  year_selected <- reactive({
    selected_year()$year
  })

  # value_box for start date
  karlmas_start <- reactive({
    as.character(selected_year()$start_date)
  })

  # value_box for end date
  karlmas_end <- reactive({
    as.character(selected_year()$end_date)
  })

  # value_box for number of gifts
  karlmas_gifts <- reactive({
    "1"
  })

  output$year_selected <- renderText(year_selected())
  output$karlmas_start <- renderText(karlmas_start())
  output$karlmas_end <- renderText(karlmas_end())
  output$karlmas_gifts <- renderText(karlmas_gifts())

  # output$about_text <- renderUI({
    #htmltools::includeHTML(path = 'inst/www/about.html')
    #htmltools::includeMarkdown(path = 'inst/www/about.md')
  # HTML(markdown::markdownToHTML('inst/www/about.md', fragment.only = TRUE))
   # })
  output$about_text <- renderUI({
    htmltools::HTML(markdown::markdownToHTML('inst/www/about.md',
                                             fragment.only = TRUE))
  })
}


