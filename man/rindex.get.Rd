% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rindex.get.R
\name{rindex.get}
\alias{rindex.get}
\title{Retrieve a material's refractive index from the database}
\usage{
rindex.get(pageid)
}
\arguments{
\item{pageid}{The material pageid from rindex.search}
}
\value{
returns a dataframe with the wavelength (in meters) dependent n and k values
}
\description{
Retrieve a material's refractive index from the database
}
\examples{

rindex.get(0)
}
