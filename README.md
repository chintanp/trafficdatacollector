
<!-- README.md is generated from README.Rmd. Please edit that file -->

# trafficdatacollector

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

The goal of trafficdatacollector is to aid the field officers in traffic
data collection as well as view the collected data.

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(trafficdatacollector)
## basic example code
```

### Things to note about the package:

1.  Uses `golem` to generate a package from R Shiny code.
    (<https://github.com/ThinkR-open/golem>)
2.  Uses modules for effective code management.
    (<https://shiny.rstudio.com/articles/modules.html>)
3.  Validation of user inputs before insertion into database using
    sqlInterpolate to avoid SQL injection attacks.
    (<https://www.rdocumentation.org/packages/DBI/versions/0.5-1/topics/sqlInterpolate>)
4.  Uses `bs4Dash` to get the husky colors and `shinyWidgets`
    actionBttn. (<https://rinterface.github.io/bs4Dash/index.html>,
    <https://github.com/dreamRs/shinyWidgets>)
5.  Diabling buttons until all the required fields have been filled
    using shinyjs. (<https://deanattali.com/shinyjs/>)
6.  Mobile-friendly user-interface except the direction counter.

### Publicly hosted

Shinyapps: <https://cp84.shinyapps.io/trafficdatacollector/>

Please note that the ‘trafficdatacollector’ project is released with a
[Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to
this project, you agree to abide by its terms.
