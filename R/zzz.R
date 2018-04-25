.onLoad <- function(libname, pkgname){

  test_file <- "extdata/refractiveindex.info-database-master/database/library.yml"

  if(!file.exists(system.file(test_file, package = "rindex"))){
    message("Installing database for first-time loading of package.")
    install_database()
  }

  db_df <<- load_database()

}
