#' Extract values from a raster brick object at the points location
#' @description Return a data frame  the values of a raster brick object for the cell in which the points fall, and the time steps are stored as Date.
#' @param file the raster brick object
#' @param points represented by a two column matrix
#'
#' @export
extract_data <- function(file, points) {

  # file <- system.file("eobs/tg_ens_mean_0.1deg_reg_2004-2005_v19.0e.nc", package = "interdecisdata")
  # points <- cbind(-8, 52)

  raster_brick <- raster::brick(file)
  ex <- t(raster::extract(raster_brick, points))
  # compute dates
  dates <- as.Date(substr(rownames(ex), 2,11),"%Y.%m.%d")

  tab <- tibble::tibble(date = dates, value = round(ex[,1:ncol(ex)],1))
  return(tab)
}
