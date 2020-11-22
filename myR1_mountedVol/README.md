Build an app with a mounted volume for export of data only (code is here copied at buildtime with Dockerfile)!!
```
docker build -t hberten/mydocker .
```

Enter a running container with bin/bash and test if the code is copied
```
docker run --rm -ti hberten/mydocker:latest /bin/bash
```

Once in the container enter:
```
cd /home/analysis && ls
```

Run a container and pick up the export in the host via the mouted volume
Make a directory first with your current user. Otherwise sudo will make one as root (and then you can't delete the directory and files in it afterwards if you do not have root privileges)
```
mkdir ~/_demos/docker/myR1_mountedVol/export
```

Run a container and execute the code
```
docker run -v ~/_demos/docker/myR1_mountedVol/export:/home/export  hberten/mydocker:latest
```

