library(tidyverse)
library(tools)

gpsFiles <- list.files("data/raw/", full.names = TRUE)
names <- basename(gpsFiles)
gpsFiles <- as.list(gpsFiles)
names(gpsFiles) <- names
gpsAll <- purrr::map(gpsFiles, read_csv)
# have to remove DeviceId column because sometimes char, sometimes double, so cant rbind
gpsAll <- purrr::map(gpsAll, subset, select = -6)
# #Have to remove an erroneous GPS points assoc with opps recordings
# gpsAll[["OPPS_010_GPS.csv"]] <- gpsAll[["OPPS_010_GPS.csv"]][1,]
gpsAll <- gpsAll %>%
  list_rbind() %>%
  select(Latitude, Longitude, UTC, DriftName) %>%
  mutate(DriftName = as_factor(DriftName))
saveRDS(gpsAll, "data/derived/drift_gps.rds")
