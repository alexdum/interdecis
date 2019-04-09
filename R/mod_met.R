#' Compute model evaluation metrics
#' @description Compute model evaluation metrics to asses the agreement between observed data and various reanalysis datasets.
#' @param dfs A data frame containing the fields date and extracted data.
#' @param obs Name of the variable in the object resulted from \code{\link{wide_to_long}} representing the referenece data.
#' @param est Name of the variable in the object resulted from \code{\link{wide_to_long}} with the estimates that are analysed.
#' @param metrics The indicators to be computed. See Details section with de description of which indicator.
#' @param split Character or vector of characters containing values to divide into groups in order to compute the metrics.
#' The data frame subsetting procedure is based on the \code{\link[openair]{cutData}} function (\pkg{openair}).
#' @details The model evaluation statistics indicators implemented here are:
#' \itemize{
#'
#' \item \eqn{ME}: mean error;
#'
#' \item \eqn{MAE}: mean absolute error;
#'
#' \item \eqn{RMSE}: root mean squared error;
#'
#' \item \eqn{COR.p}: Pearson correlation coefficient.
#' }
#' @importFrom openair cutData
#' @importFromcstats cor na.omit
#' @export

mod_met <- function(dfs, obs = "obs", est = "est",
                    metrics = c("ME", "MAE", "RMSE", "COR.p"),
                    split = c("model","year")) {


  # mean error
  ME <- function(x, est = "est", obs = "obs") {
    x <- na.omit(x[, c("est", "obs")])
    res <- mean(x$est - x$obs)
    data.frame(ME = res)
  }

  # mean absolute error
  MAE <- function(x, est = "est", obs = "obs") {
    x <- na.omit(x[, c("est", "obs")])
    res <- mean(abs(x$est - x$obs))
    data.frame(MAE = res)
  }

  # root mean squared error
  RMSE <- function(x, est = "est", obs = "obs") {
    x <- na.omit(x[, c("est", "obs")])
    res <- mean((x$est - x$obs)^2)^0.5
    data.frame(RMSE = res)
  }

  # Pearson correlation coefficient
  COR.p <- function(x, est = "est", obs = "obs") {
    x <- na.omit(x[, c("est", "obs")])
    res <- cor(x$est,x$obs, use = "pairwise.complete.obs")
    data.frame(COR.p = res)
  }

  data.sub <- cutData(dfs, split)

  if ("ME" %in% metrics) {
    ME.ind <- data.sub %>% dplyr::group_by(.dots = split) %>%
      dplyr::do(ME(., est, obs))
  } else {
    ME.ind <- NULL
  }

  if ("MAE" %in% metrics) {
    MAE.ind <- data.sub %>% dplyr::group_by(.dots = split) %>%
      dplyr::do(MAE(., est, obs))
  } else {
    MAE.ind <- NULL
  }

  if ("RMSE" %in% metrics) {
    RMSE.ind <- data.sub %>% dplyr::group_by(.dots = split) %>%
      dplyr::do(RMSE(., est, obs))
  } else {
    RMSE.ind <- NULL
  }

  if ("COR.p" %in% metrics) {
    COR.p.ind <- data.sub %>% dplyr::group_by(.dots = split) %>%
      dplyr::do(COR.p(., est, obs))
  } else {
    COR.p.ind <- NULL
  }



  # merge indicators
  accuracy <- list(ME.ind, MAE.ind, RMSE.ind, COR.p.ind)
  # remove empty lists
  accuracy <- accuracy[which(!sapply(accuracy, is.null))]
  accuracy <- Reduce(function(x, y, by = split) merge(x, y, by = split, all = TRUE), accuracy)

  return(accuracy)

}
