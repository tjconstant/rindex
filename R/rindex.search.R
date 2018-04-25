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

  material_table <- db_df[agrep(pattern = material, x = db_df$BOOK),]

  return(material_table[,1:4])
}
