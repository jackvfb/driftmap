library(ggOceanMaps)
library(ggspatial)
library(tidyverse)

drift_gps <-  readRDS("data/derived/drift_gps.rds")
bmap <- basemap(data = drift_gps, bathymetry = TRUE, bathy.style = "rbg")

# opps <- drift_gps[grep("OPPS", drift_gps$DriftName),]
# drifts <- drift_gps[grep("OPPS", drift_gps$DriftName, invert = TRUE),]

# drifts %>%
#   basemap(bathymetry = TRUE, bathy.style = "rbb") +
#   geom_spatial_path(data = drifts,
#                     mapping = aes(x = Longitude, y = Latitude,
#                                   group = DriftName),
#                     size = 1, color = 'red3') +
#   geom_point(data = opps, aes(Longitude, Latitude), shape = 17,
#              size = 2, color = 'red3') +
#   scale_y_continuous(breaks = seq(30, 40, 5))

drift_gps %>% 
  basemap(bathymetry = TRUE, bathy.style = "rbb") +
  geom_spatial_path(data = drift_gps,
                    mapping = aes(x = Longitude, y = Latitude,
                                  group = DriftName),
                    size = 1, color = 'red3')
