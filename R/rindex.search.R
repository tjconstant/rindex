#' Search the Refractive Index Materials Database
#'
#' @param material Search string for material search
#'
#' @return Dataframe of matched materials.
#' @export
#'
#' @examples
#' rindex.search("Ag")
#'
rindex.search <- function(material) {
  con <- RSQLite::dbConnect(drv = RSQLite::SQLite(), dbname = system.file("extdata", "refractive.db", package = "rindex"))
  result <-
    RSQLite::dbGetQuery(con,
               paste("SELECT * FROM pages WHERE book LIKE '%", material, "%'", sep = ""))

  RSQLite::dbDisconnect(con)
  material_table <- result[,c(1:4,6:10)]
  # material_table$rangeMin <- material_table$rangeMin * 1e-6
  # material_table$rangeMax <- material_table$rangeMax * 1e-6

  names(material_table)[7] <- "rangeMin (um)"
  names(material_table)[8] <- "rangeMax (um)"

  return(material_table)
}
