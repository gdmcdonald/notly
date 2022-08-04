#' Turn a ggplot into a plotly object
#'
#' This function takes a ggplot object and turns it into a plotly object.
#' The original ggplot object is retained inside of the new plotly object.
#' This makes this conversion reversible, allowing you to freely go back and forth betweeen ggplot and plotly.
#'
#' @param p ggplot object
#' @return Plotly object with a ggplot nested inside
#' @export

ggplotly <- function(
    p = ggplot2::last_plot(),
    width = NULL,
    height = NULL,
    tooltip = "all",
    dynamicTicks = FALSE,
    layerData = 1,
    originalData = TRUE,
    source = "A",
    ...
){
  #make plotly object
  plotly_object <- plotly::ggplotly(
    p = p,
    width = width,
    height = height,
    tooltip = tooltip,
    dynamicTicks = dynamicTicks,
    layerData = layerData,
    originalData = originalData,
    source = source,
    ...
  )

  #append ggplot
  plotly_object$ggplot <- p

  #append notly class
  class(plotly_object) <- append(class(plotly_object), "notly")

  #return object
  return(plotly_object)
}

#' Turn a notly back into a ggplot object
#'
#' This function takes a notly object (plotly with embedded ggplot) and turns it into a ggplot object.
#' It is the inverse function to `ggplotly()`, allowing you to freely go back and forth betweeen ggplot and plotly.
#'
#' @param notly_object notly object
#' @return ggplot object
#' @export
notly <- function(notly_object){
  notly_object$ggplot
}
