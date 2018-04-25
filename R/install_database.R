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

#con <- file(database_index, open = "rb", encoding = "UTF-8")
#db <- yaml::yaml.load(readLines(con))
#close(con)

#db_tree <- data.tree::as.Node(db)

#db_df <- data.tree::ToDataFrameTable(db_tree, "SHELF", "BOOK", "name", "PAGE", "data")
#db_df <- data.frame(pageid = 1:length(db_df$SHELF), db_df)
