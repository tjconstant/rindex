#' Retrieve a material's refractive index from the database
#'
#' @param pageid The material pageid from rindex.search
#'
#' @return returns a dataframe with the wavelength dependent n and k values
#' @export
#'
#' @examples
#'
#' rindex.get(0)
rindex.get <- function(pageid) {
  con <- RSQLite::dbConnect(drv = RSQLite::SQLite(), dbname = system.file("extdata", "refractive.db", package = "rindex"))

  result <-
    RSQLite::dbGetQuery(con, paste("SELECT * FROM pages WHERE pageid IS ", pageid, sep =
                            ""))

  n <-
    RSQLite::dbGetQuery(con,
               paste("SELECT * FROM refractiveindex WHERE pageid IS ", pageid, sep = ""))
  k <-
    RSQLite::dbGetQuery(con,
               paste("SELECT * FROM extcoeff WHERE pageid IS ", pageid, sep = ""))

  if (length(k$coeff) == 0)
    k <- data.frame(wave = n$wave, coeff = rep(0,length(n$refindex)))

  RSQLite::dbDisconnect(con)
  message(paste("Material: ", result$book, sep = ""))
  message(paste("Source: ", result$page, sep = ""))

  return(data.frame(
    wavelength = n$wave,
    n = n$refindex,
    k = k$coeff
  ))
}
