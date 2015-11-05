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
        "tooltips(right)"
      ),
      "in our html content from R."
    ),
    tooltipster(position="right")
  )
)

\dontrun{

# https://sjp.co.nz/projects/gridsvg/demos/tooltips/
library(gridSVG)
library(lattice)

# Add tooltip attributes to a grob on the DL
garnishAllGrobs <- function(elt) {
  if (inherits(elt, "grob")) {
    garnishGrob(
      elt,
      title = elt$name,
      class = "tooltip"#,
      #style = "pointer-events:all;"
    )
  } else {
    elt
  }
}

# third example from demo(lattice)
## Using a custom panel function to superpose a fitted normal density
## on a Kernel Density Estimate
densityplot(
  ~ height | voice.part, data = singer, layout = c(2, 4),
  xlab = "Height (inches)",
  ylab = "Kernel Density\n with Normal Fit",
  main = list("Estimated Density", cex = 1.4, col = "DarkOliveGreen"),
  panel = function(x, ...) {
    panel.densityplot(x, ...)
    panel.mathdensity(dmath = dnorm, args = list(mean=mean(x),sd=sd(x)))
  }
)

grid.DLapply(garnishAllGrobs)

browsable(
  tagList(
    HTML(XML::saveXML(grid.export(name = NULL)$svg)),
    tooltipster()
  )
)


# requires the github version of tmap
#  devtools::install_github("mtennekes/tmap")
library(tmap)
library(dplyr)
data(World)
data(metro)
metro$growth <- (metro$pop2020 - metro$pop2010) / (metro$pop2010 * 10) * 100

(tm_shape(World) +
  tm_polygons("income_grp", palette="-Blues", contrast=.7, id="name", title="Income group") +
  tm_shape(metro) +
  tm_bubbles("pop2010", col = "growth", 
             border.col = "black", border.alpha = .5, 
             style="fixed", breaks=c(-Inf, seq(0, 6, by=2), Inf),
             palette="-RdYlBu", contrast=1, 
             title.size="Metro population", 
             title.col="Growth rate (%)", id="name") + 
  tm_layout(legend.bg.color = "grey90", legend.bg.alpha=.5, legend.frame=TRUE, asp=0)) %>% 
  itmap() -> itm

browsable(
  tagList(
    itm,
    tooltipster("g")
  )
)
}
