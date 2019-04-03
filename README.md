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

Brief examples
--------------

As an example, we will use air temperature data available (E-OBS, MERA, EUROCORDEX) from package *interdecisdata*; this package can be installed with:

``` r
install.packages("http://193.26.129.60/anm_maps/interdecisdata_0.0.001.tar.gz", repos = NULL, type = "source")
```

### Extract data

Load EOBS air temperature dataset

``` r

tavg.eobs <- raster::stack(system.file("eobs/tg_ens_mean_0.1deg_reg_2004-2005_v19.0e.nc", package = "interdecisdata"))
```

Load MERA 2m air temperature dataset

``` r
tavg.mera <- raster::stack(system.file("mera/mera_t2m_daily_2004_2005.nc", package = "interdecisdata"))
# raster::plot(tavg.mera[[1:2]])
```

Load EUROCORDEX tas dataset

``` r
tavg.cordex <- raster::stack(system.file("eurocordex/tas_EUR-11_ECMWF-ERAINT_evaluation_domeniu.mic_r1i1p1_SMHI-RCA4_v1_day_20040101-20051231.nc", package = "interdecisdata"))
raster::plot(tavg.cordex[[1:2]])
```

![](README-t_eurocordex-1.png)

Extract renalysis data to point locations (lon = -8, lat = 52)

``` r
library(interdecis)
point <- cbind(lon = -8, lat = 52)

tavg.eobs.co <- extract_data(tavg.eobs, point, date1 = "2004-01-01", date2 = "2005-12-31")
tavg.mera.co <- extract_data(tavg.mera, point, date1 = "2004-01-01", date2 = "2005-12-31")
tavg.cordex.co <- extract_data(tavg.cordex, point, date1 = "2004-01-01", date2 = "2005-12-31")
```

### Compute model evaluation metrics

Convert extracted data from wide to long format

``` r
tavg.long <- wide_to_long(reference = "tavg.eobs.co", estimates = c("tavg.mera.co", "tavg.cordex.co"))
```

Calculate indicators accuracy between E-OBS data and modelled data (EURO-CORDEX and MERA)

``` r
mod_met(tavg.long)
#>            model year       ME      MAE     RMSE     COR.p
#> 1 tavg.cordex.co 2004 272.4448 272.4448 272.4480 0.9458530
#> 2 tavg.cordex.co 2005 272.3392 272.3392 272.3426 0.9492095
#> 3   tavg.mera.co 2004 272.2740 272.2740 272.2752 0.9812536
#> 4   tavg.mera.co 2005 272.2784 272.2784 272.2798 0.9818914
```
