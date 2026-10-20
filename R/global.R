#' Prepare data for use within the app
#'
#' @importFrom dplyr mutate
#' @importFrom lubridate ymd
#' @importFrom tibble tribble

  #markdown::mark_html("inst/www/about.md")
  # about_text <- HTML(markdown::markdownToHTML('inst/www/about.md',
  #                                             fragment.only = TRUE)
  #                    )

  # system.file() also works under pkgload::load_all()
  karlmas_data <- readRDS(
    system.file("extdata", "my_calendar_data.rds", package = "karlmas")
  ) |>
    dplyr::mutate(year = as.character(year))

  # Find years available in the data; used to create selection widget for years
  available_years <- as.list(unique(karlmas_data$year))
