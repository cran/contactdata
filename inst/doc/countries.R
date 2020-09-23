## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(contactdata)

## -----------------------------------------------------------------------------
(all_contacts <- list_countries())

## ---- fig.width=10, fig.fullwidth=TRUE, eval = requireNamespace("ggplot2", quietly = TRUE) & requireNamespace("maps", quietly = TRUE) & requireNamespace("countrycode", quietly = TRUE)----
library(ggplot2)

wlrd <- map_data("world")
wlrd$region <- countrycode::countryname(wlrd$region)

wlrd$included <- wlrd$region %in% all_contacts

ggplot(wlrd, aes(long, lat, group = group, fill = included)) +
  geom_polygon() +
  coord_equal() +
  theme_bw()

