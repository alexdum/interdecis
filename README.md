<!-- README.md is generated from README.Rmd. Please edit that file -->
Interdecis
----------

A package designed in R that provides capabilities to analyse the various climatic datasets performance using as reference E-OBS gridded dataset and ERA5 reanalysis product. The functions can be applied to any NetCDF files, as long as they are into a regularly spaced LAT/LON grid format. Method of comparison of the selected datasets and reference data (E-OBS/ERA5) is to analyse by using various accuracy indices, the values extracted at the closest grid point of each dataset.

With the help of the **interdecis** package, it can be documented the limits and strengths of the reanalysis and climate scenarios data sets for climate indices computation in the absence of observations. The comparison can be focussed on differences (and similarities) between selected datasets and the observations (i.e. E-OBS, ERA5) for the ECV selected in the project (2m air temperature, relative humidity, 10m wind speed, daily total of precipitation and global solar radiation).

Installing
----------

Install development versions from github with:
