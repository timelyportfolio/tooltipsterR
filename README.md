tooltipsterR
============

> Interactive Tooltip htmlwidget

[![Linux Build
Status](https://travis-ci.org//tooltipsterR.svg?branch=master)](https://travis-ci.org//tooltipsterR)
[![](http://www.r-pkg.org/badges/version/tooltipsterR)](http://www.r-pkg.org/pkg/tooltipsterR)
[![CRAN RStudio mirror
downloads](http://cranlogs.r-pkg.org/badges/tooltipsterR)](http://www.r-pkg.org/pkg/tooltipsterR)

`tooltipsterR` is an htmlwidget wrapper for the excellent jQuery
[tooltipster](iamceege.github.io/tooltipster/) library for interactive
tooltips.

Installation
------------

    devtools::install_github("timelyportfolio/tooltipsterR")

Usage
-----

### Basic with `htmltools`

    library(tooltipsterR)
    library(htmltools)

    browsable(
      tagList(
        tags$p(
          "See my ",
          tags$span(
            class="tooltip",
            style="color:gray;",
            title="tooltips provided by tooltipsterR",
            "tooltip"
          )
        ),
        tooltipster()
      )
    )

### Advanced with `svglite`

    library(tooltipsterR)
    library(htmltools)
    library(svglite)

    browsable(
      tagList(
        htmlSVG(plot(1:3,col=blues9[7:9],pch=16)),
        tooltipster(),
        tags$script(
    "
    $('circle').each(function(){
      $(this).tooltipster({
        content: $(this).css('fill')
      })
    })
    "      
        )
      )
    )

License
-------

MIT + file LICENSE Â© [Kenton Russell](https://github.com/).
