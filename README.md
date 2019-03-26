<!-- README.md is generated from README.Rmd. Please edit that file -->
Interdecis
----------

INDECIS software for intercomparison of reanalysis datasets: this is an open-source software, stand-alone and designed in R with capabilities to analyse the various climatic datasets performance using as reference E-OBS gridded dataset and ERA5 reanalysis product. The functions can be applied to any NetCDF files, as long as they are regularly spaced in the lat/lon grid format. Accuracy measures can be computed from the values extracted from the cells (grids) of the reference (E-OBS/ERA5) and analysed datasets, in which a given coordinates (points) fall.

The package is under development and currently provides common accuracy indicator for prediction models (i.e. mean error, mean absolute error, root mean squared error, correlation coefficients, index of agreement, etc). The indicators can be computed from daily data at yearly, seasonal and monthly scale. The routines implemented in the package can be applied for the ECV selected in the project (2m air temperature, relative humidity, 10m wind speed, daily total of precipitation and global solar radiation).

Installing
----------

Install the development versions from github with:

``` r
library(devtools) 
install_github("alexdum/interdecis")
```
