#' Extract values from a raster brick object at the points location
#' @description Return a data frame with the values of a raster brick object for the cell in which the points fall, and the time steps stored as Date.
#' @param file the raster brick object
#' @param points represented by a two column matrix
#' @param date1 start date for the extracted time serie (e.g. '2014-01-01')
#' @param date2 end date of the extracted time serie (e.g. '2015-12-31')
#' @export

extract_data <- function(file, points, date1, date2) {

  # file <- system.file("eurocordex/tas_EUR-11_ECMWF-ERAINT_evaluation_domeniu.mic_r1i1p1_SMHI-RCA4_v1_day_20040101-20051231.nc", package = "interdecisdata")
  # points <- cbind(-8, 52)
  # date1 <- "2004-01-01"
  # date2 <- "2005-12-31"


  if (missing(file))  stop("You must add a raster brick to 'file' argument")
  if (missing(points))  stop("You must add mtrix coordonates to 'points' argument")

  raster_brick <- raster::brick(file)
  ex <- t(raster::extract(raster_brick, points))
  # compute dates
  dates <- seq(as.Date(date1), as.Date(date2), by = "days")
  if (length(dates) != nrow(ex))  stop("Length of days is different from the length othe extracted time serie")

  tab <- tibble::tibble(date = dates, value = round(ex[,1:ncol(ex)],1))
  return(tab)
}
