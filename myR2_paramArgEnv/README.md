Build an app with a mounted volume for all app code & building stuff (in this example no code is copied at buildtime with the Dockerfile)!!
```
docker build -t hberten/mydocker --build-arg SCRIPT=iris .
```

Test that the ARG variable is passed to the container (by using the ENV command)
```
docker run hberten/mydocker env
```


Enter a running container with bin/bash and test if the code is copied
```
docker run --rm -it -v ~/_demos/docker/myR2_paramArgEnv/:/home/analysis hberten/mydocker:latest /bin/bash
cd /home/analysis && ls
```

Run the app (execute the R-scripts) and pick up the export via the mounted volume
Without passing ENV-parameter at runtime (i.e. default ARG is chosen)
```
docker run -v ~/_demos/docker/myR2_paramArgEnv/:/home/analysis hberten/mydocker:latest
```

When passing a ENV-parameter (i.e. the default ARG will now be overwritten
```
docker run -v ~/_demos/docker/myR2_paramArgEnv/:/home/analysis -e SCRIPT=cars hberten/mydocker:latest
```

If you want to test if the ENV-parameters are present in the running container
```
docker run --rm -e SCRIPT=cars hberten/mydocker:latest env
```







