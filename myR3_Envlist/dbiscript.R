library(dplyr)
library(magrittr)

connString <- Sys.getenv("CONNSTRING")
connString <- sub("\\\\","\\", connString)
con <- DBI::dbConnect(odbc::odbc(), encoding = "latin1", .connection_string = connString) 
DBI::dbIsValid(con)
p <- dplyr::tbl(con, dplyr::sql(readr::read_file('feestdagen.sql'))) %>%
  collect()
write.csv(p, "p.csv")













