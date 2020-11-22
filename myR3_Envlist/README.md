Build app with a mounted volume for export of data only (code copied at buildtime with Dockerfile)!!
```
docker build -t hberten/mydocker .
```

Check env variables in the docker container
```
docker run --rm --env-file ~/.env.list hberten/mydocker:latest env
```

Run app container via bin/bash en test de code in de container zelf
```
docker run --env-file ~/.env.list --rm -ti hberten/mydocker:latest /bin/bash
cd /home/analysis && ls
```
In R
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


Run app container en pick de export in via mounted volume
Make directory because otherwise sudo makes one as root (can't delete afterwards)
```
mkdir ~/mydocker/export
```

Without environment variables
```
docker run -v ~/_demos/myR3_Envlist/export:/home/export  hberten/mydocker
```
With environment variables
```
docker run --env-file ~/.env.list -v ~/_demos/myR3_Envlist/export:/home/export  hberten/mydocker
```

