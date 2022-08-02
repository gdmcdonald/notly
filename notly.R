library(ggplot2)
library(plotly)

ggplotly2 <- function(
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

notly <- function(notly_object){
  notly_object$ggplot
}

# Example
#
# data(iris)
#
# ggplot_object <-
#   iris %>%
#   ggplot(aes(x = Sepal.Length,
#                 y = Sepal.Width,
#                 color = Species))+
#       geom_point()
#
# notly_obj <-
# ggplot_object %>%
#   ggplotly2
#
# ggplot_obj_again <-
#   notly_obj %>%
#   notly

