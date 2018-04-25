install_database <- function(){

  install_path <- system.file("extdata",package = "rindex")
  install_file <- paste0(install_path, "/", "master.tar.gz")

  database_url <- "https://github.com/tjconstant/refractiveindex.info-database/archive/master.tar.gz"

  download.file(url = database_url, destfile = install_file)

  suppressWarnings(untar(tarfile = install_file, exdir = install_path, verbose = TRUE))

  unlink(install_file)

  message("Database Installed Sucessfully.")

}

install_database()

database_index <- system.file("extdata/refractiveindex.info-database-master/database/library.yml",package = "rindex")

db <- yaml::yaml.load(readLines(file(database_index, open = "rb", encoding = "UTF-8")))

db_tree <- data.tree::as.Node(db)

db_tree$`MAIN - simple inorganic materials`

db_df <- data.tree::ToDataFrameTable(db_tree, "SHELF", "BOOK", "name", "PAGE", "data")

head(db_df)
