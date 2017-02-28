#' Interpolated Refractive Function
#'
#' @param pageid The material pageid from rindex.search
#'
#' @return A list containing a function for n, k and the orginal dataset
#' @export
#'
#' @examples
#' rindex.search("Ag")
#'
#' Ag <- rindex.function(0)
#'
#' wavelength <- seq(0.25,0.8,,500)
#'
#' # Interpolated Functions
#' plot(wavelength,Ag$n(wavelength), type='l', ylim=c(0,5.5), xlab=expression(wavelength~(mu*m)), ylab="refractive index n/k", lwd=3)
#' lines(wavelength,Ag$k(wavelength), col=2, lwd=3)

#' # Actual Data Points
#' points(Ag$data$wavelength, Ag$data$n)
#' points(Ag$data$wavelength, Ag$data$k, col=2)

#' title("Silver (Ag)")
#' legend(0.25,5,c("n","k"), col=1:2, lwd=3)

rindex.function <- function(pageid) {
  material_parameters <- rindex.get(pageid)

  n_f <- function(wavelength) {
    if (min(wavelength) < min(material_parameters$wavelength) |
        max(wavelength) > max(material_parameters$wavelength)) {
      warning("Wavelength(s) Outside Dataset Range")
    }

    splinefun(material_parameters$wavelength, material_parameters$n)(wavelength)
  }

  k_f <- function(wavelength) {
    if (min(wavelength) < min(material_parameters$wavelength) |
        max(wavelength) > max(material_parameters$wavelength)) {
      warning(paste("Wavelength(s) Outside Dataset Range"))
    }

    splinefun(material_parameters$wavelength, material_parameters$k)(wavelength)
  }

  return(list(
    n = n_f,
    k = k_f,
    data = list(wavelength = material_parameters$wave, n = material_parameters$n, k = material_parameters$k)
  ))
}
