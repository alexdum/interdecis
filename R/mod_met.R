#' Compute model evaluation metrics
#' @description Compute model evaluation metrics to asses the agreement between observed data and various reanalysis datasets

mod_met <- function(obs = "obs", est = "est",
                    metrics = c("ME", "MAE", "RMSE", "COR")) {


  ## root mean square error
  RMSE <- function(x, est = "est", obs = "obs") {
    x <- na.omit(x[, c(mod, obs)])
    res <- mean((x[[mod]] - x[[obs]]) ^ 2) ^ 0.5
    data.frame(RMSE = res)
  }

}
