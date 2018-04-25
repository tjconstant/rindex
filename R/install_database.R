install_database <- function(){

  install_path <- system.file("extdata",package = "rindex")
  install_file <- paste0(install_path, "/", "master.tar.gz")

  database_url <- "https://github.com/tjconstant/refractiveindex.info-database/archive/master.tar.gz"

  download.file(url = database_url, destfile = install_file)

  suppressWarnings(untar(tarfile = install_file, exdir = install_path, verbose = TRUE))

  unlink(install_file)

  message("Database Installed Sucessfully.")

}

#install_database()

#database_index <- system.file("extdata/refractiveindex.info-database-master/database/library.yml",package = "rindex")

#db <- yaml::read_yaml(database_index)

