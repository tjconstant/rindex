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

  material_table <- db_df[agrep(pattern = material, x = db_df$DIVIDER),]

  return(material_table[,c(1,3,4,6)])
}
