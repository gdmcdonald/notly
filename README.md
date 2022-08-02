# `notly`
Adds the ability to turn a ggplotly object plot back into a ggplot in [Plotly R](https://github.com/plotly/plotly.R)

Notly has the following functions:

`notly::ggplotly()` which should override `plotly::ggplotly()` by adding the ggplot object to the output plotly object.

`notly::notly()` which is basically the inverse function to plotly::ggplotly(), i.e. it extracts the ggplot object back out of the plotly object.

This way if you've saved an interactive plotly object you can recover the ggplot from it for static output e.g. pdf!


Example usage:
```r
library(ggplot2)
library(plotly)
source('notly.R') # will be replaced with `library(notly)` when converted to a package

data(iris)

ggplot_object <-
  iris %>%
  ggplot(aes(x = Sepal.Length,
                y = Sepal.Width,
                color = Species))+
      geom_point()

notly_obj <-
ggplot_object %>%
  ggplotly

ggplot_obj_again <-
  notly_obj %>%
  notly
```
