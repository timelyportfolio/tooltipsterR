#devtools::install_github("timelyportfolio/tooltipsterR")

library(tooltipsterR)
library(htmltools)

browsable(
  tagList(
    tags$h1(
      "tooltipsterR htmlwidget"
    ),
    tags$p(
      "With tooltipsterR, we can get fancy ",
      tags$span(
        class = "tooltip",
        style = "border-bottom: 1px dashed #999;",
        title = "look at me",
        "tooltips"
      ),
      "in our html content from R."
    ),
    tooltipster()
  )
)