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
  return(result[,c(1:4,6:10)])

}
