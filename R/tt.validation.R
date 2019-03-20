
library(sp)

tavg.eobs <- raster::stack(system.file("eobs/tg_ens_mean_0.1deg_reg_2004-2005_v19.0e.nc", package = "interdecisdata"))
tavg.mera <- raster::brick(system.file("mera/mera_t2m_daily_2004_2005.nc", package = "interdecisdata"))
plot(tavg.eobs[[1:4]])
