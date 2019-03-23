<!-- README.md is generated from README.Rmd. Please edit that file -->
Interdecis
----------

Interdecis is an open-source software, stand-alone and designed in R with capabilities to analyse the various climatic datasets performance using as reference E-OBS gridded dataset and ERA5 reanalysis product. The functions can be applied to any NetCDF files, as long as they are into a regularly spaced LAT/LON grid format. Accuracy measures computed from the values extracted at the closest grid point of each dataset are used to test the agreement between reference (E-OBS/ERA5) and analysed datasets.

With the help of the **interdecis** package, it can be documented the limits and strengths of the reanalysis and climate scenarios data sets for climate indices computation in the absence of observations. The comparison can be focussed on differences (and similarities) between selected datasets and the observations (i.e. E-OBS, ERA5) for the ECV selected in the project (2m air temperature, relative humidity, 10m wind speed, daily total of precipitation and global solar radiation).

Installing
----------

Install the development versions from github with:

``` r
library(devtools) 
install_github("alexdum/interdecis")
```
