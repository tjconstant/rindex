#' Retrieve a material's refractive index from the database
#'
#' @param pageid The material pageid from rindex.search
#'
#' @return returns a dataframe with the wavelength (in meters) dependent n and k values
#' @export
#'
#' @examples
#'
#' rindex.get(0)
rindex.get <- function(pageid) {

  result <- read.index_file(pageid)

  message(paste("Material: ", result$material, sep = ""))
  message(paste("Source: ", result$source, sep = ""))

  return(result$data)
}
