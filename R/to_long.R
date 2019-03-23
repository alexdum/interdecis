#' Combine reference and analysed data to a tibble long format
#' @description Return a tibble data frame in long format, with the values of reference and analysed datasets, which can be used to compute models evaluation metrics
#' @param reference character with the name of the reference data object obtained with \code{\link{extract_data}} function.
#' @param estimates character vectors with the name of the objects containing the estimates that are analysed, obtained with \code{\link{extract_data}} function.
#' @importFrom magrittr %>%
#' @export

to_long <- function(reference, estimates) {

  # reference <- "tavg.eobs.co"
  # estimates <- c("tavg.mera.co", "tavg.cordex.co")

  # creates  list of the reference objects.
  dfs.ref <- lapply(reference, get)
  names(dfs.ref) <- reference

  dfs.est <- lapply(estimates, get)
  names(dfs.est) <- estimates

  # join all lists
  tab.join <- Reduce(function(...) dplyr::left_join(..., by = "date"), c(dfs.ref, dfs.est))
  names(tab.join)[2:ncol(tavg.join)] <- names(c(dfs.ref, dfs.est))

  tab.long <- tab.join %>%
    tidyr::gather(key = 'model', value = 'mod', estimates) %>%
    dplyr::rename(obs = reference)

  return(tab.long)
}
