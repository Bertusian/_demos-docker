Build app with a mounted volume for export of data only (code copied at buildtime with Dockerfile)!!
```
docker build -t hberten/mydocker .
```

Run container via bin/bash en test de code in de container zelf
```
docker run --rm -ti hberten/mydocker:latest /bin/bash
cd /home/analysis && ls
```

Run container en pick de export in via mounted volume
Make directory because otherwise sudo makes one as root (and then we can't delete the directory and files in it afterwards)
```
mkdir ~/rstudio/mydocker/export
```

Run container
```
docker run -v ~/_demos/myR1_mountedVol/export:/home/export  hberten/mydocker:latest
```

