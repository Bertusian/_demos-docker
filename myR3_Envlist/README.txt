# -------------------------
# build app with a mounted volume for export of data only (code copied at buildtime with Dockerfile)!!
# -------------------------
```
docker build -t hberten/mydocker .
```

# check env variables in the docker container
```
docker run --rm --env-file ~/.env.list hberten/mydocker:latest env
```

# run app container via bin/bash en test de code in de container zelf
# -------------------------
```
docker run --env-file ~/.env.list --rm -ti hberten/mydocker:latest /bin/bash
cd /home/analysis && ls
```
# in R
```
   library(dplyr)
   library(magrittr)
   connString <- Sys.getenv("CONNSTRING")
   connString <- sub("\\\\","\\", connString)
   con <- DBI::dbConnect(odbc::odbc(), encoding = "latin1", .connection_string = connString) 
   DBI::dbIsValid(con)
   base <- dplyr::tbl(con, dplyr::sql(readr::read_file('ingrepen.sql'))) %>% 
     collect() 
   sink("sink.txt")
   DBI::dbIsValid(con)
   connString    
   sink()
DBI::dbDisconnect(con)
```


# run app container en pick de export in via mounted volume
# -------------------------
# make directory because otherwise sudo makes one as root (can't delete afterwards)
```
mkdir ~/mydocker/export
```

# without environment variables
```
docker run -v ~/_demos/myR3_Envlist/export:/home/export  hberten/mydocker
```
# with environment variables
```
docker run --env-file ~/.env.list -v ~/_demos/myR3_Envlist/export:/home/export  hberten/mydocker
```

