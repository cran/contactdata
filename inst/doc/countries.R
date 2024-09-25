## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(contactdata)

## -----------------------------------------------------------------------------
(all_countries_2017 <- list_countries(data_source = 2017))
(all_countries_2020 <- list_countries(data_source = 2020))

## ----fig.width=10, fig.fullwidth=TRUE, eval = requireNamespace("ggplot2", quietly = TRUE) & requireNamespace("maps", quietly = TRUE) & requireNamespace("countrycode", quietly = TRUE)----
library(ggplot2)

wrld <- map_data("world")
wrld$region <- countrycode::countryname(wrld$region)

wrld$included <- "Not included"

wrld$included[wrld$region %in% all_countries_2020] <- "2020"
wrld$included[wrld$region %in% all_countries_2017] <- "2017 & 2020"

ggplot(wrld, aes(long, lat, group = group, fill = included)) +
  geom_polygon() +
  coord_equal() +
  theme_bw()

