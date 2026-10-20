#' Cycle Stats app standalone function
#'
#' Wrapper function for `shinyApp()`
#'
#' @return shiny app
#'
#' @import shiny
#'
#' @export karlmasApp
#'
karlmasApp <- function() {
  shiny::shinyApp(ui = karlmas_ui, server = karlmas_server)
}

