

library("ggplot2")
penguins |> 
  ggplot() + 
  # add the aesthetics
  aes(x = body_mass_g, 
      y = flipper_length_mm,
      colour = species) +
  # add a geometry
  geom_point() + 
  # tidy up the labels
  labs(x = "Body mass (g)",
       y = "Flipper length (mm)",
       colour = "Species")
penguins = penguins |>
  dplyr::mutate(species = stringr::word(species, start = 1, end = 1))
glimpse(penguins)

ggsave(filename = "myfirstplot.png")

install.packages("plotly")
library("plotly")
myplot = penguins |> 
  ggplot() +
  # add the aesthetics
  aes(x = body_mass_g,
      y = flipper_length_mm,
      colour = species) +
  # add a geometry
  geom_point() +
  # tidy up the labels
  labs(x = "Body mass (g)",
       y = "Flipper length (mm)",
       colour = "Species")
plotly::ggplotly(myplot)

billplot = penguins |>
  ggplot() +
  # add aesthetics
  aes(x = culmen_length_mm,
      y = culmen_depth_mm,
      colour = sex) +
  # add geometry
  geom_point() +
  # tidy up labels
  labs(x = "Bill length (mm)",
       y = "Bill depth (mm)",
       colour = "Sex") +
  facet_wrap(vars(species, island))
plotly::ggplotly(billplot)


flipper_plot = penguins |>
  ggplot() +
  aes(x = flipper_length_mm,
      colour = species) +
  geom_histogram() +
  labs(x = "Flipper length (mm)",
       y = "",
       colour = "Species") +
  facet_wrap(vars(species))
plotly::ggplotly(flipper_plot)
