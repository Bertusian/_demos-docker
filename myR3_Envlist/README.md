Build an app with a mounted volume for export of data only (the code thus is copuied at buildtime with the Dockerfile)!!
```
docker build -t hberten/mydocker .
```

Check the ENV-variables in the docker container
```
docker run --rm --env-file ~/.env.list hberten/mydocker:latest env
```

Run a container with bin/bash and test if the code is present in the container
```
docker run --env-file ~/.env.list --rm -ti hberten/mydocker:latest /bin/bash
```

Once in the container:
```
cd /home/analysis && ls
R
```

In R run:
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

Make a directory first with your current user. Otherwise sudo will make one as root (and then you can't delete the directory and files in it afterwards if you do not have root privileges)
```
mkdir ~/_demos/docker/myR3_Envlist/export
```

Without ENV-variables
```
docker run -v ~/_demos/docker/myR3_Envlist/export:/home/export  hberten/mydocker
```
With ENV-variables
```
docker run --env-file ~/.env.list -v ~/_demos/docker/myR3_Envlist/export:/home/export  hberten/mydocker
```

