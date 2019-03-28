#' Compute model evaluation metrics
#' @description Compute model evaluation metrics to asses the agreement between observed data and various reanalysis datasets.
#' @param obs Name of the variable in the object resulted from \code{\link{wide_to_long}} representing the referenece data.
#' @param est Name of the variable in the object resulted from \code{\link{wide_to_long}} the estimates that are analysed.
#' @param metrics The indicators to be computed. See Details section with de description of which indicator.
#' @param split Character or vector of characters containing values to divide into groups in order to compute the metrics.
#' The data frame subsetting procedure is based on the \code{\link[openair]{cutData}} function (\pkg{openair}).
#' @importFrom openair cutData
#' @export
mod_met <- function(obs = "obs", est = "est",
                   metrics = c("ME", "MAE", "RMSE", "COR"),
                    split = "default") {


  ## root mean square error
  RMSE <- function(x, est = "est", obs = "obs") {
    x <- na.omit(x[, c(mod, obs)])
    res <- mean((x[[mod]] - x[[obs]]) ^ 2) ^ 0.5
    data.frame(RMSE = res)
  }

}
