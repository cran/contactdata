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
contact_data <- contact_df_countries(countries, location = "all")

## ---- eval = requireNamespace("ggplot2", quietly = TRUE)----------------------
library(ggplot2)
ggplot(contact_data, aes(x = age_from, y = age_to, fill = contact)) + 
  geom_tile() +
  facet_wrap(~ country) +
  coord_equal()

## ---- eval = requireNamespace("ggplot2", quietly = TRUE)----------------------
ggplot(contact_data, aes(x = age_from, y = age_to, fill = contact)) + 
  geom_tile() +
  facet_wrap(~ country) +
  coord_equal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  scale_fill_viridis_c()

## -----------------------------------------------------------------------------
contact_data <- contact_df_countries(countries, location = "school")

## ---- eval = requireNamespace("ggplot2", quietly = TRUE)----------------------
ggplot(contact_data, aes(x = age_from, y = age_to, fill = contact)) + 
  geom_tile() +
  facet_wrap(~ country) +
  coord_equal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  scale_fill_viridis_c()

