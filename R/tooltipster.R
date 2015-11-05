#' Tooltips htmlwidget
#'
#' Add tooltips to HTML content using the tooltipster jQuery library.
#' 
#' @param selector any valid \code{CSS} selector.  By default,
#'           \code{".tooltip"} will be provided.
#' @param ... \code{list} of options for \code{tooltipster}.  See
#'           \href{https://iamceege.github.io/tooltipster}{toolipster options}
#'           for a complete reference.
#'           
#' @example ./inst/examples/examples.R
#'
#' @import htmlwidgets
#'
#' @export
tooltipster <- function(selector = ".tooltip", ...) {

  # forward options using x
  x = list(
    selector = selector,
    options = list(...)
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'tooltipster',
    x,
    width = 0,
    height = 0,
    package = 'tooltipsterR'
  )
}

tooltipster_html <- function(id, style, class, ...){
  htmltools::tags$div(
    id = id,
    style = style,
    style = "display:none;",
    class = class
  )
}
