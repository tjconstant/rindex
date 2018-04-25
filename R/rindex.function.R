#' Interpolated Refractive Function
#'
#' @param pageid The material pageid from rindex.search
#'
#' @return A function that will return the complex refractive index(s), given the wavelength(s) in meters
#' @export
#'
#' @examples
#' rindex.search("Ag")
#'
#' Ag_data <- rindex.get(0)
#' Ag <- rindex.function(0)
#'
#' wavelengths <- seq(210,12300,, 1000) * 1e-9
#'
#' plot(Ag_data$wavelength, Ag_data$n, log="x",  xlab = "wavelength (m) - log scale", ylab = "n")
#' lines(wavelengths, Re(Ag(wavelengths)), col = 2, lwd = 2)


rindex.function <- function(pageid) {

  material_parameters <- rindex.get(pageid)

  n_f <- function(wavelength) {

    if (min(wavelength) < min(material_parameters$wavelength) |
        max(wavelength) > max(material_parameters$wavelength)) {
      warning("Wavelength(s) Outside Dataset Range")
    }

    stats::splinefun(material_parameters$wavelength, material_parameters$n)(wavelength)
  }

  k_f <- function(wavelength) {

    if (min(wavelength) < min(material_parameters$wavelength) |
        max(wavelength) > max(material_parameters$wavelength)) {
      warning(paste("Wavelength(s) Outside Dataset Range", range(material_parameters$wavelength)))
    }

    stats::splinefun(material_parameters$wavelength, material_parameters$k)(wavelength)
  }

  index_function <- function(wavelength){

    #wavelength <- wavelength * 1e6 # convert to microns (expecting meters)

    return(n_f(wavelength) + 1i*k_f(wavelength))

  }

  return(index_function)

}
