## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.height = 10,
  fig.width = 10
)

## -----------------------------------------------------------------------------
library(contactdata)

## -----------------------------------------------------------------------------
countries <- c("Portugal", "Spain", "Italy", "France", "Ireland", "Belgium", "Luxembourg", "Germany", "Switzerland")

## -----------------------------------------------------------------------------
age_data <- age_df_countries(countries)

## ---- eval = requireNamespace("ggplot2", quietly = TRUE)----------------------
library(ggplot2)
ggplot(age_data, aes(x = population, y = age)) + 
  geom_bar(stat = "identity") +
  facet_wrap(~ country, scales = "free")

